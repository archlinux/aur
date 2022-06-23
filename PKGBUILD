# Maintainer: Gustavo Costa <xfgusta@gmail.com>

pkgname=execdir
pkgver=0.1.0
pkgrel=1
pkgdesc='Execute a command in a specific directory'
arch=(x86_64)
url="https://github.com/xfgusta/$pkgname"
license=(MIT)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('6f4a3603bae2c5b666d90d6db2526ad85044c376')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX='/usr' install
  install -D -m 0644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
}

