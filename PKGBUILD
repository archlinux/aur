# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
_pkgname='vimdict'
pkgname="${_pkgname}-git"
pkgver=r3.8ac470c
pkgrel=1
pkgdesc='Look up word definitions in vim, using dict. '
arch=('x86_64')
url='https://github.com/soystemd/vimdict'
license=('GPL')
makedepends=('git')
depends=('dictd')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
