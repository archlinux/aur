pkgname=we10x-icon-theme-git
_pkgname=We10X-icon-theme
pkgver=r35.3391e42
pkgrel=1
pkgdesc="A colorful design icon theme for linux desktops"
arch=('any')
makedepends=('git' 'gtk-update-icon-cache')
license=('GPL3')
url="https://github.com/yeyushengfan258/$_pkgname"
source=("git+${url}")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package_we10x-icon-theme-git() {
    provides=('we10x-icon-theme')

    cd "$srcdir/$_pkgname"
    install -dm755 "$pkgdir/usr/share/icons"
    ./install.sh  --all --dest "$pkgdir/usr/share/icons"

}
