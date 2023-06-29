# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="batch-explorer-bin"
pkgver=2.17.0stable.801
_appver=2.17.0-stable.801
pkgrel=1
pkgdesc="A client tool to help create, debug and monitor Azure Batch Applications"
arch=("x86_64")
url="https://azure.github.io/BatchExplorer/"
_githuburl="https://github.com/Azure/BatchExplorer"
license=('MIT')
depends=('nspr' 'libxfixes' 'libxcb' 'alsa-lib' 'at-spi2-core' 'readline' 'libxshmfence' 'gcc-libs' 'libdrm' 'hicolor-icon-theme' \
    'pango' 'dbus' 'cairo' 'glib2' 'gtk3' 'gdk-pixbuf2' 'libxkbcommon' 'util-linux-libs' 'expat' 'libcups' 'libxext' 'libxrandr' \
    'bzip2' 'openssl-1.1' 'mesa' 'libx11' 'nss' 'zlib' 'libxcomposite' 'glibc' 'xz' 'libxdamage' 'python')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${_appver}/${pkgname%-bin}_${_appver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/Azure/BatchExplorer/main/LICENSE")
sha256sums=('91e41bda7f79eb4ae5f15c7780c8b837bdfda35ba0037e807759c051817f0262'
            '0b9ebab8a849f3ae8ed5bd7a35022bff9dce901efeeb53e855e91c02c8500ab0')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}