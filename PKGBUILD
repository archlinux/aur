# Maintainer: Wynne Plaga <rwplaga dot linux at gmail dot com>

pkgname=gogh-git
_pkgname=gogh
_reponame=Gogh
pkgver=385.ed8df18
pkgrel=1
pkgdesc="Color Scheme for Gnome Terminal, Pantheon Terminal and Tilix"
arch=('any')
url="https://github.com/Mayccoll/Gogh"
#license=('MIT')
depends=('dconf' 'wget')
makedepends=('git')
source=("git+https://github.com/Mayccoll/Gogh.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_reponame"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_reponame"

    install -D -m755 "${_pkgname}.sh" "$pkgdir/usr/bin/gogh"
}

