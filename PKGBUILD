# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=cross-install
pkgname=$_pkgname-git
pkgver=1.0.0.r1.g518b516
pkgrel=1
pkgdesc='POSIX-complient cross-platform install command'
arch=('any')
url='https://git.stefanwimmer128.eu/stefanwimmer128/cross-install'
license=('MPL2')
depends=('sh')
makedepends=('git' 'shellcheck' 'getoptions' 'moreutils')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://git.stefanwimmer128.eu/stefanwimmer128/cross-install.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"

    make
}

check() {
    cd "$_pkgname"

    make check
}

package() {
    cd "$_pkgname"

    make DESTDIR="$pkgdir" install
}
