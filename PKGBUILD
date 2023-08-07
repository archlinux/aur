# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=podman-desktop-companion-bin
pkgver=4.1.0_rc.28
pkgrel=2
pkgdesc="Cross-platform desktop integrated application with consistent UI,Learning tool for the powerful podman command line interface"
arch=("aarch64" "x86_64")
url="https://iongion.github.io/podman-desktop-companion/"
_githuburl="https://github.com/iongion/podman-desktop-companion"
license=('MIT')
depends=('hicolor-icon-theme' 'libcups' 'at-spi2-core' 'libxext' 'libx11' 'glib2' 'libxrandr' 'nspr' 'pango' 'gcc-libs' 'mesa' 'gdk-pixbuf2' \
    'libxdamage' 'libdrm' 'dbus' 'gtk3' 'alsa-lib' 'nss' 'libxfixes' 'glibc' 'libxcb' 'libxcomposite' 'cairo' 'libxkbcommon' 'expat' 'podman')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/${pkgver//_/-}/${pkgname%-bin}-arm64-${pkgver//_/-}.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/${pkgver//_/-}/${pkgname%-bin}-amd64-${pkgver//_/-}.deb")
source=("LICENSE::https://raw.githubusercontent.com/iongion/podman-desktop-companion/main/LICENSE")
sha256sums=('1a33f39c0fb06d0bf3bc82dbb2ca621ebd225158dd9a73557f7f583a9d61ece6')
sha256sums_aarch64=('5e506578978e843362ebfdd6b27778a65491264599e442e246784e570ea9d392')
sha256sums_x86_64=('7801f0c01c402807bba07dc9ca7d559b0181d05a8049a33a776c55a44eed2c38')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}