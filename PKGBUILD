# Maintainer: Dave Shoreman <aur+nextshot at dsdev dot io>
pkgname=nextshot
pkgver=1.4.5
pkgrel=3
pkgdesc="A simple screenshot tool that uploads to Nextcloud and works with Sway and X11"
arch=('x86_64')
url="https://github.com/dshoreman/nextshot"
license=('GPL')
depends=('bash' 'curl' 'jq')
optdepends=(
    "yad: tray icon and gui support"
    "grim: take screenshots on Sway"
    "slurp: area selection on Sway"
    "wl-clipboard: clipboard support on Sway"
    "bc: colour conversion on X11"
    "imagemagick: take screenshots on X11"
    "slop: window/area selection on X11"
    "xclip: clipboard support on X11"
)
install=nextshot.install
source=(https://github.com/dshoreman/nextshot/archive/v${pkgver}.tar.gz)
sha256sums=('e63fde5edc8a460efc41bae53b69652ff0456cf8c15ac15f59a87898c3a9e4df')

build() {
    cd "$pkgname-$pkgver"

    make
}

package() {
    cd "$pkgname-$pkgver"

    make DESTDIR="$pkgdir/" install
}
