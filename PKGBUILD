# Maintainer: Gustavo Costa <xfgusta@gmail.com>

pkgname=execdir
pkgver=0.2.0
pkgrel=1
pkgdesc='Execute a command in a specific directory'
arch=(x86_64)
url="https://github.com/xfgusta/$pkgname"
license=(MIT)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('0b027673312e7ebe80667f7a55bed8f07eb344e1')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX='/usr' install
  install -D -m 0644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
}

