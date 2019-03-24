# Maintainer: PhotonX <photon89 [at] gmail.com>.

pkgname=i4oled-gui
pkgver=1.2
pkgrel=1
pkgdesc="A graphical user interface for i4oled, a utility to set and render OLED icons on Wacom Intuos4 family tablets"
arch=('i686' 'x86_64')
url="https://github.com/PrzemoF/i4oled-gui"
license=('GPL2')
depends=('dconf' 'gtk3')
source=("https://github.com/PrzemoF/i4oled-gui/archive/v$pkgver.tar.gz")
md5sums=('7cd5c3e9beb89a0f053d8bb9ac13dbdf')


build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}