# Maintainer: James Tucker <jftucker@gmail.com>
# Contributor: Chris Sutcliff <chris@sutcliff.me>
# Contributor: TheCyberArcher <TheCyberArcher@protonmail.ch>
pkgname=music-assistant-desktop-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="Music Assistant Desktop Companion App"
arch=('x86_64')
url="https://github.com/music-assistant/desktop-app"
license=('Apache-2.0')
depends=(
    'alsa-lib'
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libgcc'
    'libpulse'
    'libsoup3'
    'webkit2gtk-4.1'
)
optdepends=(
    'libappindicator-gtk3: system tray support'
)
conflicts=('music-assistant-desktop' 'music-assistant-desktop-git' 'music-assistant-companion-git' 'music-assistant-app-git' 'music-assistant-desktop-app-git')
source=("$pkgname-$pkgver.deb::$url/releases/download/$pkgver/Music.Assistant_${pkgver}_amd64.deb")
sha256sums=('342568cc0fd883dfa12c25cd63f2d5bde45d8a52527a941ff7bd0879b770024a')

package() {
    cd "$srcdir"

    # Extract the deb package
    bsdtar -xf data.tar.gz -C "$pkgdir"

    # Install license
    install -Dm644 "$pkgdir/usr/share/doc/music-assistant-companion/copyright" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true
}
