# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=diffuse
pkgname="${_pkgname}-player-bin"
pkgver=3.3.0
pkgrel=2
pkgdesc="A music player that connects to your cloud/distributed storage."
arch=('x86_64')
url="https://diffuse.sh/"
_githuburl="https://github.com/icidasset/diffuse"
license=(custom)
depends=(webkit2gtk openssl gcc-libs gtk3 gdk-pixbuf2 pango glibc glib2 cairo hicolor-icon-theme)
conflicts=("${_pkgname}-player-appimage")
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${_pkgname}-linux-amd64.deb"
    "LICENSE::${_githuburl}/raw/main/LICENSE")
sha256sums=('47703b10325b6e4d65960d573b1a6a8b04d992a523ce2b2605aae0ec0522bcd0'
            '0a21c689228ea59b37ff87f23146184df79a56822674db6b2be9e976748d3833')
package() {
    bsdtar -xf data.tar.gz -C "${pkgdir}" --uname root --gname root
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}