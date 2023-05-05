# Maintainer: Dave Shoreman <aur+nextshot at dsdev dot io>
pkgname=nextshot
pkgver=1.4.4
pkgrel=1
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
    "imagemagick: take screenshots on X11"
    "slop: window/area selection on X11"
    "xclip: clipboard support on X11"
)
install=nextshot.install
source=(https://github.com/dshoreman/nextshot/archive/v${pkgver}.tar.gz)
sha256sums=('0c41d9ca6dcc4829501b017801848852f2522d74d92ae243a4e56e38e0f92738')

package() {
    cd "$pkgname-$pkgver"

    make DESTDIR="$pkgdir/" install
}
