# Maintainer: Nguyen Ky <nhktmdzhg at google mail dot com>
_pkgname=expressvpn-gui
pkgname=expressvpn-gui-nhk
pkgver=0.1.0
pkgrel=1
pkgdesc='Unofficial linux GUI for expressvpn CLI (Qt)'
arch=('x86_64')
url="https://github.com/nhktmdzhg/${_pkgname}"
provides=('expressvpn-gui')
conflicts=('expressvpn-gui')
license=('custom')
depends=(
    bash
    pyside6
    expressvpn
    python-pexpect
)
source=("git+${url}.git#tag=v${pkgver}")
md5sums=('SKIP')

package() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p "${pkgdir}/opt/${_pkgname}"
    touch "${pkgdir}/opt/${_pkgname}/settings.dat"
    chmod 777 "${pkgdir}/opt/${_pkgname}/settings.dat"
    cp -r . "${pkgdir}/opt/${_pkgname}"
    install -Dm755 "$srcdir/${_pkgname}/${_pkgname}" "$pkgdir/usr/bin/$_pkgname"
    desktop-file-install "$srcdir/${_pkgname}/${_pkgname}.desktop" --dir "$pkgdir/usr/share/applications/"
}
