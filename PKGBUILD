# Maintainer: Radim Sückr <kontakt@radimsuckr.cz>

# This PKGBUILD is based on https://aur.archlinux.org/packages/jdtls, thank you

pkgname=lemminx
pkgver=0.17.1
_jarname="${pkgname}-${pkgver}.jar"
pkgrel=1
pkgdesc='Eclipse XML language server'
arch=('any')
url='https://github.com/eclipse/lemminx'
license=('EPL')
depends=('bash'
         'java-runtime')
makedepends=()
# https://download.eclipse.org/lemminx/releases/
source=("${_jarname}::https://download.eclipse.org/lemminx/releases/${pkgver}/org.eclipse.lemminx-uber.jar"
        'launcher.sh')
sha512sums=('4ada7847be4157df6b1c4ebf03e261f78a262b11a42d87523348b7e68a3ffe335d47de92a743826c9a126be3aa6b8ce3227473cd10ccdf8fc4e71f350381d827'
            '75a5e092fc2ddf3b6079067d54608308032da61432126afdc74ab75149ccad42a3da8a422bb631ed8d9fa7986757064e6c4946ac7961b50b8b03f8e2d1819a1e')

package() {
    mkdir -p "${pkgdir}/usr/share/java/lemminx"
    mkdir -p "${pkgdir}/usr/bin"

    cp "${srcdir}/${_jarname}" "${pkgdir}/usr/share/java/lemminx/${_jarname}"

    install "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/lemminx"
}
