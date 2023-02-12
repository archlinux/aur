# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: alecksandr <sansepiol26@gmail.com>
pkgname=assert-fortran-git
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="This is an assertion module for fortran, easy to use"
arch=(x86_64)
url="https://github.com/alecksandr26/assert-fortran"
license=('MIT license')
depends=()
makedepends=(gcc-fortran make binutils coreutils)
optdepends=(valgrind)
source=("git+$url")
md5sums=('SKIP')

# Compile the source code 
build () {
    cd assert-fortran/
    make compile
}

# Set the compiled files to create the package
# in this specific order to be able to be installed
package() {
    cd $pkgdir
    mkdir -p usr
    mkdir -p usr/lib
    mkdir -p usr/include
    cd ../../src/assert-fortran/
    make ROOT_DIR=$pkgdir install
}
