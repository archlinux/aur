# Maintainer: Zach Rice <bynxmusic@gmail.com>
pkgname=tylex-git
pkgver=latest
pkgrel=1
pkgdesc="A simple, rofi/dmenu-based text expander for tiling window managers."
arch=('any')
url="https://github.com/raoeus/tylex"
license=('MIT')
depends=(
    'bash'
    'jq'
    'rofi'
    'rofi-wayland'
    'dmenu'
    'xdotool'
    'wtype'
)
provides=("tylex")
conflicts=("tylex")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

# This function automatically updates the package version based on git history.
pkgver() {
    cd "$pkgname"
    printf "%s.r%s.g%s" "0.1.0" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    # No build step is necessary for shell scripts
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
