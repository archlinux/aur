# Maintainer: Eslam Allam eslamallam73@gmail.com
_pkgname=razer-control-revived
pkgname=${_pkgname}-bin
conflicts=()
pkgver=0.3.6
pkgrel=1
pkgdesc="revived version of an old software to support 2025 Razer Blade 16 with newer UI etc... (Experiemental but works)"
arch=('x86_64')
url="https://github.com/encomjp/razer-control-revived"
license=('GPL-2.0')   # Change as needed
depends=('rust' 'gtk4' 'libadwaita' 'hidapi')
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/razercontrol-revived_${pkgver}_amd64.deb" "${_pkgname}.install")
sha256sums=('5f2fad0cd4c9e5a7b0cb450a8e0d3dea3b4d99d03a77f1a64d77d4a7d1aec2ee' '36fa36453407cc44fd8ad1b86b3ddeae8ce87955dc89891e18ac5a8edebe2877')
install="${_pkgname}.install"
package() {
    bsdtar -xOf "$srcdir/${_pkgname}-${pkgver}.deb" data.tar.zst | bsdtar -C "$pkgdir" -xv
    ln -s "$pkgdir/usr/bin/razer-daemon" "$pkgdir/usr/share/razercontrol/daemon"
}
