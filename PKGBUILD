# Maintainer: Eslam Allam eslamallam73@gmail.com
_pkgname=razer-control-revived
pkgname=${_pkgname}-bin
conflicts=()
pkgver=0.3.5
pkgrel=1
pkgdesc="revived version of an old software to support 2025 Razer Blade 16 with newer UI etc... (Experiemental but works)"
arch=('x86_64')
url="https://github.com/encomjp/razer-control-revived"
license=('GPL-2.0')   # Change as needed
depends=('rust' 'gtk4' 'libadwaita' 'hidapi')
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/razercontrol-revived_${pkgver}_amd64.deb" "${_pkgname}.install")
sha256sums=('d4302b4f58b90d4bf6a7f976a69be380229b12cbce287e86f1ef515e22b85dc9' '36fa36453407cc44fd8ad1b86b3ddeae8ce87955dc89891e18ac5a8edebe2877')
install="${_pkgname}.install"
package() {
    bsdtar -xOf "$srcdir/${_pkgname}-${pkgver}.deb" data.tar.zst | bsdtar -C "$pkgdir" -xv
    ln -s "$pkgdir/usr/bin/razer-daemon" "$pkgdir/usr/share/razercontrol/daemon"
}
