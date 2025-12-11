# Maintainer: Shurui Liu <srliu3264@gmail.com>
pkgname=srtodo-git
_pkgname=srtodo
pkgver=r3.de64536
pkgrel=1
pkgdesc="A Rofi-based markdown todo manager"
arch=('any')
url="https://github.com/srliu3264/srtodo"
license=('MIT')
depends=('rofi' 'gawk' 'sed' 'xdg-utils')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 srtodo "$pkgdir/usr/bin/$_pkgname"
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    fi
}
