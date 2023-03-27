# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=netpad
pkgname="${_pkgname}-bin"
pkgver=0.1.1
pkgrel=1
pkgdesc="A cross-platform C# editor and playground."
arch=('x86_64')
url="https://github.com/tareqimbasher/NetPad"
license=(MIT)
providers=(tareqimbasher)
conflits=("${_pkgname}-appimage")
depends=(at-spi2-core gtk3 alsa-lib nss libcups cairo dbus gcc-libs hicolor-icon-theme zlib libxcb libxdamage libxcomposite \
    glib2 libx11 libxfixes libdrm glibc nspr expat libxext libxshmfence libxkbcommon pango gdk-pixbuf2 mesa libxrandr)
source=("${_pkgname}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x64.pacman"
    "LICENSE::${url}/raw/main/LICENSE")
sha256sums=('d7d52078eed8bca658ec6f0ea969bb730309bbed60155a7fb8b75358116ea591'
            'bf644b3a7e5dc5d7c4ce8b9db8c8df97d41efa3c1bff8e4c7dfe78e668561341')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}