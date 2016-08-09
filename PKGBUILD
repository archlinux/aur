# Maintainer: Ebrahim Azarisooreh <ebrahim.azarisooreh@gmail.com>
pkgname=mousetrap
pkgver=3.0.0
pkgrel=1
pkgdesc="An X11 utility that hides the mouse pointer after a specified interval of time"
arch=('any')
url="https://github.com/eazar001/mousetrap"
license=('MIT')
depends=('python-xlib-devel' 'libx11' 'libxfixes')
makedepends=()
provides=('mousetrap')
backup=()
options=()
install=mousetrap.install
source=("https://github.com/eazar001/$pkgname/archive/$pkgver.tar.gz")
md5sums=('bb92566812d8d86b2b1880c1e17e7159')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
