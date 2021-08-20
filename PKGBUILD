# Maintainer: Radim Sückr <kontakt@radimsuckr.cz>

# This PKGBUILD is based on https://aur.archlinux.org/packages/jdtls, thank you

pkgname=lemminx
pkgver=0.18.0
_jarname="${pkgname}-${pkgver}.jar"
pkgrel=1
pkgdesc='Eclipse XML language server'
arch=('any')
url='https://github.com/eclipse/lemminx'
license=('EPL')
depends=('java-runtime')
makedepends=()
# https://download.eclipse.org/lemminx/releases/
source=("${_jarname}::https://download.eclipse.org/lemminx/releases/${pkgver}/org.eclipse.lemminx-uber.jar"
        'launcher.sh')
sha512sums=('0abed55cb2594c91f65ada761e268cb669bf0d2c9b7c699922eededadae5c022a367c561c1ab6aa5e0646b0b4aab221e89100e72cf4a84d1805c84ec1425a73c'
            '21973956910861bb7c608a0240cc8fd2ef15a5753bfee8df36dfda39721a06d474a66c59a22501b990fb3d3d063531a385dca62a7e91b248c1cb9509aff77cec')

package() {
    mkdir -p "${pkgdir}/usr/share/java/lemminx"
    mkdir -p "${pkgdir}/usr/bin"

    cp "${srcdir}/${_jarname}" "${pkgdir}/usr/share/java/lemminx/${_jarname}"

    install "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/lemminx"
}
