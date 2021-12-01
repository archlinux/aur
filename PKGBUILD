# Maintainer: Radim Sückr <kontakt@radimsuckr.cz>

# This PKGBUILD is based on https://aur.archlinux.org/packages/jdtls, thank you

pkgname=lemminx
pkgver=0.18.1
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
sha512sums=('c666889e7838954d92fa49f7b42838de828e262023f5f219def368edaff0c07bb6c31db61b2164272c7c9c33c747d59fd6a532d1d63cf316a6bbe97364832226'
            '21973956910861bb7c608a0240cc8fd2ef15a5753bfee8df36dfda39721a06d474a66c59a22501b990fb3d3d063531a385dca62a7e91b248c1cb9509aff77cec')

package() {
    mkdir -p "${pkgdir}/usr/share/java/lemminx"
    mkdir -p "${pkgdir}/usr/bin"

    cp "${srcdir}/${_jarname}" "${pkgdir}/usr/share/java/lemminx/${_jarname}"

    install "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/lemminx"
}
