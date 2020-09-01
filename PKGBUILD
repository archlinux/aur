pkgname=mcmuse-circle-git
_pkgname=McMuse-circle
pkgver=r30.55596ca2
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
package_mcmuse-circle-git() {
    provides=('mcmuse-circle')

    cd "$srcdir/$_pkgname"
    install -dm755 "$pkgdir/usr/share/icons"
    ./install.sh  --all --dest "$pkgdir/usr/share/icons"

}
