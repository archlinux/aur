# Maintainer: Ehsan Ghorbannezad <ehsan at disroot dot org>
_pkgname=opener
pkgname=$_pkgname-git
pkgver=r6.ca47b12
pkgrel=2
pkgdesc='mime-type and extention based file opener script.'
url=https://github.com/soystemd/opener
source=("git+$url.git")
arch=(x86_64)
license=(GPL)
depends=(file)
makedepends=(git)
md5sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
