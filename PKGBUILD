# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="diffuse-player-bin"
pkgver=3.3.0
pkgrel=3
pkgdesc="A music player that connects to your cloud/distributed storage."
arch=('x86_64')
url="https://diffuse.sh/"
_githuburl="https://github.com/icidasset/diffuse"
license=(custom)
depends=('webkit2gtk' 'openssl' 'gcc-libs' 'gtk3' 'gdk-pixbuf2' 'pango' 'glibc' 'glib2' 'cairo' 'hicolor-icon-theme')
conflicts=("${pkgname%-player-bin}-appimage" "${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-player-bin}-linux-amd64.deb"
    "LICENSE::${_githuburl}/raw/main/LICENSE")
sha256sums=('47703b10325b6e4d65960d573b1a6a8b04d992a523ce2b2605aae0ec0522bcd0'
            '22f6e9359127b271eba050bc6e87abc699982ace7a6b386c1c346c7f3154eda8')
package() {
    bsdtar -xf data.tar.gz -C "${pkgdir}" --uname root --gname root
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}