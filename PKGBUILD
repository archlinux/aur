# Maintainer: RedTide <redtid3@gmail.com>

pkgname=smarthhc
pkgver=0.1.2alpha
pkgrel=1
_pkgname="${pkgname}-${pkgver}"
pkgdesc="Digital HiHat Controller"
url="https://github.com/azdrums/${pkgname}"
arch=('x86_64')
license=('GPL2')
depends=('qt5-base' 'qt5-serialport' 'qt5-connectivity')
optdepends=('bluez: to work with bluetooth device')
source=("https://github.com/azdrums/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('a34794c48ec657eca9671cd536525a0af6504b6f9dd620c9f0cbad2422cb632cd9996b027445b2fa1f0512f33f725f83893e4c33f889b6c106ba52f6c6c0cb7c')
build() {
    cd "${srcdir}/${_pkgname}"
    qmake PREFIX="/usr/" SmartHHC.pro
    make INSTALL_DIR=$pkgdir
}
package() {
    cd "${srcdir}/${_pkgname}"
    make INSTALL_ROOT=$pkgdir install
}
