# Maintainer: Estanislau Trepat <etrepat@gmail.com>

_pkgname=dbeaver
pkgname=dbeaver-ce-jre-bin
pkgver=25.1.4
pkgrel=1
pkgdesc="Free universal SQL Client for developers and database administrators (community edition, with bundled JRE)"
arch=("x86_64")
url="https://dbeaver.io/"
license=("Apache-2.0")
depends=("gtk3" "gtk-update-icon-cache" "libsecret")
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-ce-bin")
options=("!strip")
source=("https://github.com/dbeaver/dbeaver/releases/download/$pkgver/dbeaver-ce-$pkgver-linux.gtk.x86_64.tar.gz"
        "dbeaver-ce.desktop")
sha256sums=('ff1701a849bcbe1a1f4ce46bd73433aee7d3b872fae7047624f78d4a2aea65e7'
            "d2868335b94575e1958620d7a087cfa258a1ed23d67e5bacbb303e66d70ec4d2")

package() {
    install -m 755 -d "${pkgdir}/opt"
    cp -r "${_pkgname}" "${pkgdir}/opt/${_pkgname}"

    install -m 755 -d "${pkgdir}/usr/bin"
    install -m 755 -d "${pkgdir}/usr/share/applications"
    install -m 755 -d "${pkgdir}/usr/share/pixmaps"

    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -m 755 -t "${pkgdir}/usr/share/applications" "${srcdir}/dbeaver-ce.desktop"
    install -m 755 -t "${pkgdir}/usr/share/pixmaps" "${srcdir}/${_pkgname}/dbeaver.png"
}
