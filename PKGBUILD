# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=wox
pkgname=${_pkgname}-bin
pkgver=2.0.0_nightly
pkgrel=4
pkgdesc="A cross-platform launcher that simply works"
arch=(x86_64)
url='https://github.com/Wox-launcher/Wox'
license=('GPL3')
depends=('webkit2gtk' 'libayatana-indicator' 'glibc' 'libx11' 'libxtst' 'pango' 'ayatana-ido' 'at-spi2-core' 'glib2' 'cairo' 'harfbuzz' 'gdk-pixbuf2' 'libayatana-appindicator' 'zlib' 'gtk3' 'libdbusmenu-glib')
provides=(${_pkgname})
conflicts=(${_pkgname}-git ${_pkgname})
options=(!strip)
source=(
    "${_pkgname}-${pkgver}-${pkgrel}::https://github.com/Wox-launcher/Wox/releases/download/v${pkgver//_/-}/wox-linux-amd64-20240318-26e71c"
)
sha256sums=(
    "95a4ec1b342aa3b9e6414a20fd12d21515fbe2269ec02416c869f32d3e05e5d7"
)

package() {
    install -Dm755 "$srcdir/${_pkgname}-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/${_pkgname}"
}
