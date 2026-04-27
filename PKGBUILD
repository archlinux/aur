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
source=("lucid-${pkgver}.tar.gz")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

package() {
    # Install binary
    install -Dm755 "${srcdir}/usr/bin/lucid" "${pkgdir}/usr/bin/lucid"
    
    # Install bundled libraries (for custom whisper/llama builds)
    install -d "${pkgdir}/usr/lib"
    cp -r "${srcdir}/usr/lib/"* "${pkgdir}/usr/lib/"
    
    # Install desktop file
    install -Dm644 "${srcdir}/usr/share/applications/lucid.desktop" \
        "${pkgdir}/usr/share/applications/lucidvideo.desktop"
    
    # Install icon
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/lucid.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/lucidvideo.svg"
}
