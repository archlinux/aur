# Maintainer: Estanislau Trepat <etrepat@gmail.com>

_pkgname=dbeaver
pkgname=dbeaver-ce-jre-bin
pkgver=25.3.5
pkgrel=1
pkgdesc="Free universal SQL Client for developers and database administrators (community edition, with bundled JRE)"
arch=("x86_64")
url="https://dbeaver.io/"
license=("Apache-2.0")
depends=("gtk3" "gtk-update-icon-cache" "libsecret")
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-ce-bin")
options=("!strip")
source=("https://github.com/dbeaver/dbeaver/releases/download/$pkgver/dbeaver-ce-$pkgver-linux-x86_64.tar.gz"
        "dbeaver-ce.desktop")
sha256sums=('a548cb336b4f215b86898a6fd1481f52720d3d1c7375b06f00f7de5f856cae7f'
            "b51d2902df94a35869fdde14a77b49bb08374a5a66a833ae4009efbfc616f2c6")

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
