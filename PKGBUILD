# Maintainer: Ebrahim Azarisooreh <ebrahim.azarisooreh@gmail.com>
pkgname=mousetrap
pkgver=1.0.0
pkgrel=1
pkgdesc="An X11 utility that hides the mouse pointer after a specified interval of time"
arch=('x86_64' 'i686')
url="https://github.com/eazar001/mousetrap"
license=('MIT')
depends=('python-evdev' 'libx11')
makedepends=('cargo' 'rust')
provides=('mousetrap')
backup=()
options=()
install=mousetrap.install
source=("https://github.com/eazar001/$pkgname/archive/$pkgver.tar.gz")
md5sums=('a63b8e7aa0c496f7f84bcc479db34a14')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
