# Maintainer: Gustavo Costa <xfgusta@gmail.com>

pkgname=xdump
pkgver=0.1.1
pkgrel=1
pkgdesc='Display file contents in hexadecimal and ASCII'
arch=(x86_64)
url='https://github.com/xfgusta/xdump'
license=(MIT)
source=("https://github.com/xfgusta/xdump/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX='/usr' install
  install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
}
