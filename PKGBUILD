# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: alecksandr <sansepiol26@gmail.com>
pkgname=datastructure-lib-for-c-git
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="This is my personal data structure library for c, it has an avl, map, stack structures and more"
arch=(x86_64)
url="https://github.com/alecksandr26/datastructure-lib-for-c"
license=('Apache License 2.0')
depends=()
makedepends=(gcc git make binutils coreutils)
optdepends=(valgrind)
source=("git+$url")
md5sums=('SKIP')

# Compile the source code 
build () {
    cd datastructure-lib-for-c/
    make compile
}

# Set the compiled files to create the package
# in this specific order to be able to be installed
package() {
    cd $pkgdir
    mkdir -p usr
    mkdir -p usr/lib
    cp ../../src/datastructure-lib-for-c/lib/libds.a usr/lib/
    cp -r ../../src/datastructure-lib-for-c/include usr/
}
