# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=veyon
pkgname="${_pkgname}-bin"
pkgver=4.7.5
pkgrel=1
pkgdesc="A free and open source software for monitoring and controlling computers across multiple platforms."
arch=("x86_64")
url="https://veyon.io/"
_githuburl="https://github.com/veyon/veyon"
license=(GPL2)
depends=('qt5-base' 'libxcomposite' 'libxdamage' 'gcc-libs' 'libxfixes' 'libxi' 'libxext' 'libxtst' 'libxrandr' 'procps-ng' \
    'libxinerama' 'openssl' 'pam' 'hicolor-icon-theme' 'glibc' 'libx11')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}.1-ubuntu.jammy_amd64.deb")
sha256sums=('95cb94794c4c4c2433ca2b154028e0db0494f6d0ecea0c8e4166aae9a333be2c')
    
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/lib/systemd" "${pkgdir}/usr/lib"
    mv "${pkgdir}/usr/lib/x86_64-linux-gnu/${_pkgname}" "${pkgdir}/usr/lib/${_pkgname}"
    rm -rf "${pkgdir}/lib" "${pkgdir}/usr/lib/x86_64-linux-gnu"
    chmod 0755  "${pkgdir}/usr/bin/veyon-auth-helper"
}