# @file PKGBUILD 
# @brief The package script
# @author Erick Carrillo.
# @copyright Copyright (C) 2023, Erick Alejandro Carrillo López, All right reserved.
# @license This project is released under the MIT License 

# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: alecksandr <sansepiol26@gmail.com>
pkgname=c-exceptions
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="This module provides a simple macro interface that allows for easy exception handling in C, similar to Python's approach."
arch=(x86_64)
url="https://github.com/alecksandr26/c-exceptions"
license=('MIT License')
depends=()
makedepends=(gcc git make binutils coreutils)
optdepends=(valgrind)
source=("git+$url")
md5sums=('SKIP')

# Compile the source code 
build () {
    cd $pkgname/
    make compile
}

# Set the compiled files to create the package
# in this specific order to be able to be installed
package() {
    cd $pkgdir
    mkdir -p usr
    mkdir -p usr/lib
    cp -r ../../src/$pkgname/lib usr/
    cp -r ../../src/$pkgname/include usr/
}
