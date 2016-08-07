# Maintainer: Ebrahim Azarisooreh <ebrahim.azarisooreh@gmail.com>
pkgname=mousetrap
pkgver=2.0.0
pkgrel=1
pkgdesc="An X11 utility that hides the mouse pointer after a specified interval of time"
arch=('x86_64' 'i686')
url="https://github.com/eazar001/mousetrap"
license=('MIT')
depends=('python-evdev' 'python-xlib' 'libx11' 'libxfixes')
makedepends=()
provides=('mousetrap')
backup=()
options=()
install=mousetrap.install
source=("https://github.com/eazar001/$pkgname/archive/$pkgver.tar.gz")
md5sums=('6c0fed71d6fcdf23c9a9c353b45c47c5')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
