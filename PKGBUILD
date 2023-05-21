# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="mbcord-bin"
pkgver=3.0.7
pkgrel=1
pkgdesc="An Emby/Jellyfin rich presence client for Discord"
arch=('x86_64')
url="https://mbcord.sandwichfox.de/"
_githuburl="https://github.com/SandwichFox/MBCord"
license=('MIT')
conflits=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('at-spi2-core' 'alsa-lib' 'gtk3' 'nss' 'glibc' 'cairo' 'mesa' 'libxrandr' 'libxcomposite' \
        'libxfixes' 'pango' 'nspr' 'libxdamage' 'libdrm' 'libcups' 'expat' 'libxcb' 'dbus' 'gcc-libs' \
        'glib2' 'libxext' 'libx11' 'libxkbcommon' 'hicolor-icon-theme')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/SandwichFox/MBCord/master/LICENSE")
sha256sums=('f93b47d1384c217115373c2e6a4cb93f000aa54687fed7013d8bc91eecc386cd'
            '25f147af5b79f33fbdfbc0b16dcae3db7d19fa67b58f7a95c3d5cabe8638d011')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/icons/hicolor/0x0" "${pkgdir}/usr/share/icons/hicolor/512x512"
}