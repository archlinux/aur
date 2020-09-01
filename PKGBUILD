pkgname=memphis98-icon-theme-git
_pkgname=Memphis98
pkgver=r32.2d0c5fe
pkgrel=1
pkgdesc="Icon pack for KDE Plasma and LXQt based on famous Windows 98/2000 icons"
arch=('any')
makedepends=('git')
license=('GPL3')
url="https://github.com/Stanton731/$_pkgname"
source=("git+${url}")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

shopt -s extglob

package_memphis98-icon-theme-git() {
    provides=('memphis98-icon-theme')

    mkdir -p "$pkgdir/usr/share/icons/Memphis98"

    cd "$_pkgname"

    cp -r !(Preview.png|README.md) "$pkgdir/usr/share/icons/Memphis98"
}
