# Maintainer: koonix <ehsan at disroot dot org>
_pkgname='grub-entries'
pkgname="${_pkgname}-git"
pkgver='r9.4f939c1'
pkgrel=4
pkgdesc="A script to list grub's top-level menu entries."
url='https://github.com/koonix/grub-entries'
arch=('x86_64')
license=('GPL')
makedepends=('git')
source=("git+${url}.git")
md5sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
    cd "$_pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
