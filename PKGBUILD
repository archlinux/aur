# Maintainer: Jonathan Dönszelmann <jonabent@gmail.com>
pkgname=nailgun-git
pkgver=r270.a41d7cc
pkgrel=1
pkgdesc="Command-line client, protocol and server for Java programs"
arch=(x86_64)
url=""
license=('Apache License 2.0')
groups=()
depends=('java-runtime')
makedepends=('java-environment')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('nailgun::git+https://github.com/facebook/nailgun#branch=main')
noextract=()
md5sums=('SKIP') 

pkgver() {
    cd "nailgun"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "nailgun"

    make ng
}

package() {
    cd "nailgun"

    make install PREFIX="$pkgdir/usr"
}
