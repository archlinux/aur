# Maintainer: Gustavo Costa <xfgusta@gmail.com>

pkgname=execdir
pkgver=0.3.0
pkgrel=1
pkgdesc='Execute a command in a specific directory'
arch=(x86_64)
url="https://github.com/xfgusta/$pkgname"
license=(MIT)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('db8156be58dace107d05efca1236a6dad833c93b')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX='/usr' install
  install -D -m 0644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
}

