# Maintainer: kofany <j@dabrowski.biz>
pkgname=subterm-bin
pkgver=0.2.23
pkgrel=1
pkgdesc="Cross-platform SSH and SFTP client with GPU-accelerated terminal rendering"
arch=('x86_64')
url="https://github.com/kofany/subterm-releases"
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
provides=('subterm')
conflicts=('subterm')
options=('!strip' '!debug')
source=("subterm-bin-${pkgver}.pkg.tar.zst::https://github.com/kofany/subterm-releases/releases/download/v${pkgver}/subterm-bin-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('1ba61f4eb3a73092de120d3c64ffe1cd5e0feef2a36a1a2a694567a67cd31fd9')
noextract=("subterm-bin-${pkgver}.pkg.tar.zst")

package() {
    cd "${srcdir}"
    bsdtar -xf "subterm-bin-${pkgver}.pkg.tar.zst" -C "${pkgdir}/"
    rm -f "${pkgdir}/.PKGINFO" "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" 2>/dev/null || true
}
