# Maintainer: galister <galister at librevr dot org>

pkgname=wlx-overlay-s-git
_pkgname=wlx-overlay-s
pkgver=r147.a8582b6
pkgrel=1

pkgdesc="Wayland/X11 desktop overlay for SteamVR and OpenXR"
arch=('x86_64')
url="https://github.com/galister/wlx-overlay-s"
license=('GPL3')

provides=('wlx-overlay-s')
conflicts=('wlx-overlay-s')
depends=('fontconfig' 'alsa-lib' 'libxkbcommon' 'pipewire')
makedepends=('git' 'rust' 'binutils' 'fakeroot' 'pkg-config' 'cmake' 'python3' 'clang' 'openxr')

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
        cd "$srcdir/$_pkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$srcdir/$_pkgname"
        cargo build --release
}

package() {
        cd "$srcdir/$_pkgname"
        install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
        install -Dm755 target/release/wlx-overlay-s -t "$pkgdir/usr/bin/"

        install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
                                       Paste                
        install -Dm644 "$_pkgname.png" Select All           /icons/hicolor/256x256/apps/$_pkgname.png"
}                                                           
                                       How-to disable mouse 
