# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
pkgname=antares-sql-bin
pkgver=0.7.9
pkgrel=1
pkgdesc="A modern, fast and productivity driven SQL client with a focus in UX."
arch=("x86_64")
url="https://antares-sql.app/"
_githuburl="https://github.com/antares-sql/antares"
license=("MIT")
depends=('hicolor-icon-theme' 'gcc-libs' 'glibc' 'gtk3' 'nspr' 'libxcomposite' 'libcups' 'alsa-lib' 'cairo' 'nss' \
    'libxdamage' 'mesa' 'libxext' 'pango' 'glib2' 'libdrm' 'dbus' 'libxrandr' 'libx11' 'sh' 'libxfixes' 'libxkbcommon' \
    'expat' 'libxcb' 'at-spi2-core' )
options=(!strip)
conflit=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Antares-${pkgver}-linux_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/antares-sql/antares/master/LICENSE")
sha256sums=('8fb4096b4ab681bb26f3421f00c90579e5ac8fa80cf978e1a24f1755427cc3d6'
            '7b960bb0bed7d2228b6a8a879558c97906cc041ab14ab1d1089959902f386613')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}