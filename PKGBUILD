# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=netpad-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="A cross-platform C# editor and playground."
arch=('x86_64')
url="https://github.com/tareqimbasher/NetPad"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('at-spi2-core' 'gtk3' 'alsa-lib' 'nss' 'libcups' 'cairo' 'dbus' 'gcc-libs' 'hicolor-icon-theme' \
    'zlib' 'libxcb' 'libxdamage' 'libxcomposite' 'glib2' 'libx11' 'libxfixes' 'libdrm' 'glibc' 'nspr' 'expat' \
    'libxext' 'libxkbcommon' 'pango' 'mesa' 'libxrandr')
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.pacman"
    "LICENSE::https://raw.githubusercontent.com/tareqimbasher/NetPad/main/LICENSE")
sha256sums=('1fed6ae83155cfa66b0a3f3cdde39cfe06f2179e730d5386dea25f096c236027'
            '43485534798b716310ae2a0edeebb00e97ff0e42e5fde13ff2994e2bc82348f6')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}