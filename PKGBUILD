# Maintainer: juicerq <julio.cerqueiira@gmail.com>
pkgname=witch-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Track your followed Twitch streamers"
arch=('x86_64')
url="https://github.com/juicerq/witch"
license=('MIT')
depends=(
    'cairo'
    'desktop-file-utils'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
)
provides=('witch')
conflicts=('witch')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/witch_${pkgver}_amd64.deb")
sha256sums=('4fadb55dfd7e7ff5de30776dd10d5f3d25ffc47d20500418df38de7b8f266ac9')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"

    # Install license
    install -Dm644 "${pkgdir}/usr/share/doc/witch/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
