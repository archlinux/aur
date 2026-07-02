# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Wynne Plaga <rwplaga dot linux at gmail dot com>

pkgname=gogh-git
_pkgname=gogh
_reponame=Gogh
pkgver=1138.80f46a2
pkgrel=1
pkgdesc="Color Scheme for Gnome Terminal, Pantheon Terminal and Tilix"
arch=('any')
url="https://github.com/Gogh-Co/Gogh"
license=('MIT')
depends=('dconf' 'wget' 'util-linux-libs')
makedepends=('git')
source=("git+https://github.com/Gogh-Co/Gogh.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_reponame"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_reponame"

    install -D -m755 "${_pkgname}.sh" "$pkgdir/usr/bin/gogh"
}
