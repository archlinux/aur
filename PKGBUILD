# Maintainer: Antonis G. <capoiosct at gmail dot com>

_pkgname='xpad'
pkgname='xpad-dkms-git'
pkgver='0.4'
pkgrel='1'
pkgdesc="Driver for the Xbox/ Xbox 360/ Xbox 360 Wireless/ Xbox One Controllers"
arch=('i686' 'x86_64')
url="https://github.com/paroj/xpad"
license=('GPL2')
install="${pkgname}.install"
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgname}-dkms")
source=("${pkgname}::git+https://github.com/paroj/xpad.git"
        "${pkgname}.install")
md5sums=('SKIP'
         '75cad51dc48d8fa879f926432beabf66')

package() {
    cd "$srcdir/$pkgname"

    install -d "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    install -m 644 -T xpad.c "${pkgdir}/usr/src/${_pkgname}-${pkgver}/${_pkgname}.c"
    install -m 644 -T Makefile "${pkgdir}/usr/src/${_pkgname}-${pkgver}/Makefile"
    install -m 644 -T dkms.conf "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
}
