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
            '8057afeb9ec8660ea8f8b391545408e7d833b2d10d9fb59bb0f396a39ef4727547c3547745986323aec3f3cc717eafdd93b25c6ef1859c8e4f5b936054b6ca5b')

package() {
    mkdir -p "${pkgdir}/usr/share/java/lemminx"
    mkdir -p "${pkgdir}/usr/bin"

    cp "${srcdir}/${_jarname}" "${pkgdir}/usr/share/java/lemminx/${_jarname}"

    install "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/lemminx"
}
