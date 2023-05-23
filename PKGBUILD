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
pkgname=unittest-c
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="unittest c is a fast and simple macro-based unit testing framework for C.
It's inspired by the Python unittest module and designed to reduce boilerplate code.
With macros and a built-in test runner, it's ideal for large test suites."
arch=(x86_64)
url="https://github.com/alecksandr26/unittest-c"
license=('MIT License')
depends=()
makedepends=(gcc git make binutils coreutils c-exceptions)
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
