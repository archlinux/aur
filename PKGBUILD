# Maintainer: Lee Stripp <leestripp@gmail.com>
pkgname=lucidvideo
pkgver=0.4.0
pkgrel=1
pkgdesc="Intelligent video library with AI-powered search and semantic understanding"
arch=('x86_64')
url="https://gitlab.com/leestripp/lucid"
license=('MIT')
depends=('gtk4' 'libadwaita' 'gstreamer1.0-libav' 'gstreamer1.0-plugins-base' 'gstreamer1.0-plugins-good' 'sqlite3' 'curl' 'json-glib')
makedepends=()
optdepends=()
provides=('lucidvideo')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("lucid-${pkgver}.tar.gz::https://gitlab.com/leestripp/lucid/-/archive/v${pkgver}/lucid-v${pkgver}.tar.gz")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

package() {
    # Install binary
    install -Dm755 "${srcdir}/lucid-${pkgver}/build/lucid" "${pkgdir}/usr/bin/lucid"
    
    # Install bundled libraries (for custom whisper/llama builds)
    install -d "${pkgdir}/usr/lib"
    cp -r "${srcdir}/lucid-${pkgver}/build/libs/"* "${pkgdir}/usr/lib/"
    
    # Install desktop file
    install -Dm644 "${srcdir}/lucid-${pkgver}/data/lucid.desktop" \
        "${pkgdir}/usr/share/applications/lucidvideo.desktop"
    
    # Install icon
    install -Dm644 "${srcdir}/lucid-${pkgver}/resources/icons/lucid-app.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/lucidvideo.svg"
}
