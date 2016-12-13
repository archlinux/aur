# Maintainer: Kristian Gunstone <kristian.gunstone.butnotthispart@pean.northis.org>
pkgname=netris
pkgver=0.52 # Is automatically updated by pkgver() below
pkgrel=1
pkgdesc="Mark H. Weaver's Netris -- A free networked version of T*tris. This is Nathan Aclander's github fork with several bugfixes and improvements"
arch=('i686' 'x86_64')
url="https://github.com/naclander/netris.git"
license=('GPL2')
depends=()
makedepends=('git')
provides=()
conflicts=()
sha1sums+=('SKIP')
md5sums=('SKIP')
source=("${pkgname}"::"git+https://github.com/naclander/netris.git")

pkgver() {
    head -n1 "$pkgname/VERSION"
}

build() {
    cd "$pkgname"
    ./Configure
    make
}

package() {
    mkdir -p "$pkgdir/usr/bin/"
    cp -v "$pkgname/netris" "$pkgdir/usr/bin/netris"
    cp -v "$pkgname/sr"     "$pkgdir/usr/bin/netris-sr"
}
