# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
pkgname=antares-sql-bin
pkgver=0.7.12
pkgrel=1
pkgdesc="A modern, fast and productivity driven SQL client with a focus in UX."
arch=("aarch64" "armv7h" "x86_64")
url="https://antares-sql.app/"
_githuburl="https://github.com/antares-sql/antares"
license=("MIT")
depends=('hicolor-icon-theme' 'gcc-libs' 'glibc' 'gtk3' 'nspr' 'libxcomposite' 'libcups' 'alsa-lib' 'cairo' 'nss' \
    'libxdamage' 'mesa' 'libxext' 'pango' 'glib2' 'libdrm' 'dbus' 'libxrandr' 'libx11' 'sh' 'libxfixes' 'libxkbcommon' \
    'expat' 'libxcb' 'at-spi2-core' )
conflit=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
provides=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/Antares-${pkgver}-linux_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/Antares-${pkgver}-linux_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/Antares-${pkgver}-linux_amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/antares-sql/antares/master/LICENSE")
sha256sums=('7b960bb0bed7d2228b6a8a879558c97906cc041ab14ab1d1089959902f386613')
sha256sums_aarch64=('42b4b31a5d601f5b16fb8bb4dd498d517b0261405a855908123294ab909b7f97')
sha256sums_armv7h=('041ed31374bd32905e13f967810e89c785de941455b6308dbf811bba81b33827')
sha256sums_x86_64=('10c18d925fd03f1033ebf76561b00e08afe78ee806625883b4f97a77252f50bb')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}