# Maintainer: kofany <j@dabrowski.biz>
pkgname=terx-bin
pkgver=0.2.11
pkgrel=1
pkgdesc="Cross-platform SSH client with GPU-accelerated terminal rendering"
arch=('x86_64')
url="https://github.com/OutrageLabs/terX"
license=('custom:proprietary')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'glib2'
    'gdk-pixbuf2'
    'cairo'
    'pango'
    'libsoup3'
    'openssl'
    'hicolor-icon-theme'
)
optdepends=(
    'libappindicator-gtk3: system tray support'
    'gst-plugins-good: video/audio support'
)
provides=('terx')
conflicts=('terx')
options=('!strip' '!debug')
source=("terx-bin-${pkgver}.pkg.tar.zst::https://github.com/OutrageLabs/terX/releases/download/v${pkgver}/terx-bin-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('1c22ec83323de2b07729ef750a286efbf028a4f6c90c9781bd0c68fd6708ce2c')
noextract=("terx-bin-${pkgver}.pkg.tar.zst")

package() {
    cd "${srcdir}"
    bsdtar -xf "terx-bin-${pkgver}.pkg.tar.zst" -C "${pkgdir}/"
    rm -f "${pkgdir}/.PKGINFO" "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" 2>/dev/null || true
}
