# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=winusb-git
pkgver=r94.72aa1d9
pkgrel=1
pkgdesc='Simple tool to create a usb stick installer for Windows (Vista and above)'
arch=('i686' 'x86_64')
url="http://en.congelli.eu/prog_info_winusb.html"
license=('GPL3')
depends=('wxgtk' 'grub' 'ntfs-3g' 'gksu' 'parted' 'dosfstools')
makedepends=('diffutils')
conflicts=('winusb')
provides=('winusb')
source=('winusb-git::git+https://github.com/slacka/WinUSB.git')
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
        cd ${srcdir}/${pkgname}
        echo "r$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
