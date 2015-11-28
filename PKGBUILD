# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
# Contributor: Manalishi <manalishi at freenet dot de>
pkgname=ft232r_prog
pkgver=1.25
pkgrel=1
pkgdesc="A command-line interface for reconfiguring the FT232R chip"
arch=('i686' 'x86_64')
url="http://www.rtr.ca/ft232r/"
license=('GPL')
depends=('libusb-compat' 'libftdi-compat')
source=("http://www.rtr.ca/ft232r/ft232r_prog-${pkgver}.tar.gz")
sha256sums=('31dde0188c23b7b8ea684ce29f11ef8f6ddd4c2899dd189786bd171b6616e4ee')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 ft232r_prog ${pkgdir}/usr/bin/ft232r_prog
}
