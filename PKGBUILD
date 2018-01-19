# Maintainer: Robot <robot@artificial.engineering>
pkgname=gnome-shell-extension-lycheejs
_pkgname=${pkgname%-git}

pkgver=r6.128e6e3
pkgrel=1
pkgdesc="Manage lychee.js Projects and Libraries"
arch=('any')
url="https://github.com/Artificial-Engineering/gnome-shell-extension-lycheejs"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=("git+https://github.com/Artificial-Engineering/gnome-shell-extension-lycheejs")
md5sums=('SKIP')

_folder="lycheejs@artificial.engineering"

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/$_folder"
    cp -r source/* "$pkgdir/usr/share/gnome-shell/extensions/$_folder"
}
