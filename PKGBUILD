# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=batch-explorer-bin
pkgver=2.18.0_stable.868
pkgrel=3
pkgdesc="A client tool to help create, debug and monitor Azure Batch Applications"
arch=("x86_64")
url="https://azure.github.io/BatchExplorer/"
_githuburl="https://github.com/Azure/BatchExplorer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('nspr' 'libxfixes' 'libxcb' 'alsa-lib' 'at-spi2-core' 'readline' 'libxshmfence' 'gcc-libs' 'libdrm' 'hicolor-icon-theme' \
    'pango' 'dbus' 'cairo' 'glib2' 'gtk3' 'gdk-pixbuf2' 'libxkbcommon' 'util-linux-libs' 'expat' 'libcups' 'libxext' 'libxrandr' \
    'bzip2' 'openssl-1.1' 'mesa' 'libx11' 'nss' 'zlib' 'libxcomposite' 'glibc' 'xz' 'libxdamage' 'python')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/Azure/BatchExplorer/main/LICENSE")
sha256sums=('69752b0627371fa8425ede726709e124036cd6259525238a9819fb4e2b184be9'
            '0b9ebab8a849f3ae8ed5bd7a35022bff9dce901efeeb53e855e91c02c8500ab0')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}