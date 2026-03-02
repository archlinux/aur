# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-cursors-hyprcursor-git
_reponame=Sweet
_pkgname=Sweet-cursors-hyprcursor
pkgver=r445.1d92ac7
pkgrel=1
pkgdesc="Sweet cursor theme for hyprcursor"
arch=('x86_64')
url="https://github.com/Gigas002/$_reponame"
license=('GPL3')
makedepends=('git' 'inkscape' 'xorg-xcursorgen')
depends=('hyprcursor')
optdepends=()
provides=("Sweet-cursors-hyprcursor")
options=('!strip')
source=("git+$url.git#branch=cursors")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_reponame/kde/cursors"
    chmod +x build_hyprcursors.sh

    ./build_hyprcursors.sh
}

package() {
    install -d "$pkgdir/usr/share/icons"

    cp -R "$srcdir/$_reponame/kde/cursors/Sweet-cursors-hyprcursor" "$pkgdir/usr/share/icons"
}

