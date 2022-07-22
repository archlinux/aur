# Maintainer: Ehsan Ghorbannezad <ehsan at disroot dot org>
_pkgname='vimdict'
pkgname="${_pkgname}-git"
pkgver=r4.a6e22c1
pkgrel=3
pkgdesc='Look up word definitions in vim, using dict. '
url='https://github.com/ghesy/vimdict'
arch=('x86_64')
license=('GPL')
makedepends=('git')
depends=('dictd')
source=("git+${url}.git")
md5sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
