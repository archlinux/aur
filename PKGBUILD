# Maintainer: Ebrahim Azarisooreh <ebrahim.azarisooreh@gmail.com>
pkgname=mousetrap
pkgver=3.0.2
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
md5sums=('4d5da3d448da8077d82b3a48fad3de46')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" aur_install
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
