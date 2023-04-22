# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="netpad-bin"
pkgver=0.1.1
pkgrel=2
pkgdesc="A cross-platform C# editor and playground."
arch=('x86_64')
url="https://github.com/tareqimbasher/NetPad"
license=('MIT')
providers=()
conflits=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('at-spi2-core' 'gtk3' 'alsa-lib' 'nss' 'libcups' 'cairo' 'dbus' 'gcc-libs' 'hicolor-icon-theme' \
    'zlib' 'libxcb' 'libxdamage' 'libxcomposite' 'glib2' 'libx11' 'libxfixes' 'libdrm' 'glibc' 'nspr' 'expat' \
    'libxext' 'libxshmfence' 'libxkbcommon' 'pango' 'gdk-pixbuf2' 'mesa' 'libxrandr')
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-x64.pacman"
    "LICENSE::${url}/raw/main/LICENSE")
sha256sums=('d7d52078eed8bca658ec6f0ea969bb730309bbed60155a7fb8b75358116ea591'
            '43485534798b716310ae2a0edeebb00e97ff0e42e5fde13ff2994e2bc82348f6')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
