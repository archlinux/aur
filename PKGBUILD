# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
_pkgname='grub-entries'
pkgname="${_pkgname}-git"
pkgver=r4.d35ba0b
pkgrel=1
pkgdesc="A script to list grub's top-level menu entries."
arch=(x86_64)
url='https://github.com/soystemd/grub-entries'
license=(GPL)
makedepends=(git)
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
}
