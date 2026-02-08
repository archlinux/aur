# Maintainer: James Tucker <jftucker@gmail.com>
# Contributor: Chris Sutcliff <chris@sutcliff.me>
# Contributor: TheCyberArcher <TheCyberArcher@protonmail.ch>
pkgname=music-assistant-desktop-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Music Assistant Desktop Companion App"
arch=('x86_64')
url="https://github.com/music-assistant/desktop-app"
license=('Apache-2.0')
depends=(
    'cairo'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'openssl'
    'webkit2gtk-4.1'
)
optdepends=(
    'libappindicator-gtk3: system tray support'
)
conflicts=('music-assistant-desktop' 'music-assistant-desktop-git' 'music-assistant-companion-git' 'music-assistant-app-git' 'music-assistant-desktop-app-git')
source=("$pkgname-$pkgver.deb::$url/releases/download/$pkgver/Music.Assistant_${pkgver}_amd64.deb")
sha256sums=('a53bb6fa65c958930ee95ee48200c5a1929c1cb81605689fb54abc69c9599ca9')

package() {
    cd "$srcdir"

    # Extract the deb package
    bsdtar -xf data.tar.gz -C "$pkgdir"

    # Install license
    install -Dm644 "$pkgdir/usr/share/doc/music-assistant-companion/copyright" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true
}
