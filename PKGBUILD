# Maintainer: Ehsan Ghorbannezad <ehsan at disroot dot org>
_pkgname=grub-entries
pkgname=${_pkgname}-git
pkgver=r4.d35ba0b
pkgrel=2
pkgdesc="A script to list grub's top-level menu entries."
url=https://github.com/soystemd/grub-entries
arch=(x86_64)
license=(GPL)
makedepends=(git)
source=("git+$url.git")
md5sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
