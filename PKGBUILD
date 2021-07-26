# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
_pkgname='opener'
pkgname="${_pkgname}-git"
pkgver=r6.ca47b12
pkgrel=1
pkgdesc='mime-type and extention based file opener script.'
arch=('x86_64')
url='https://github.com/soystemd/opener'
license=('GPL')
depends=('file')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
