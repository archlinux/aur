# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=wox
pkgname=${_pkgname}-bin
pkgver=2.0.0_alpha.1
pkgrel=33
pkgdesc="A cross-platform launcher that simply works"
arch=(x86_64)
url='https://github.com/Wox-launcher/Wox'
license=('MIT')
depends=('webkit2gtk' 'libayatana-indicator' 'glibc' 'libx11' 'libxtst' 'pango' 'ayatana-ido' 'at-spi2-core' 'glib2' 'cairo' 'harfbuzz' 'gdk-pixbuf2' 'libayatana-appindicator' 'zlib' 'gtk3' 'libdbusmenu-glib')
provides=(${_pkgname})
conflicts=(${_pkgname}-git ${_pkgname})
options=(!strip)
source=(
    "${_pkgname}::https://github.com/Wox-launcher/Wox/releases/download/v${pkgver//_/-}/wox-linux-amd64-20231122-abbd55"
    "LICENSE::https://raw.githubusercontent.com/Wox-launcher/Wox/v2/LICENSE"
)
sha256sums=(
    "af25de00ee217d7bc902279d7c1bcdc066f11be6957fa31da8b23907859cf440"
    "2fbd1d33505f08f37255a80ce0449326ca70eaf145daed016f310d2c4cc8d0b7"
)

package() {
    install -Dm755 "$srcdir/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
