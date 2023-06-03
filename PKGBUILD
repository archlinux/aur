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
pkgname=trycatch-c
pkgver=1.2.0
pkgrel=1
epoch=
pkgdesc="This module offers a straightforward macro interface that facilitates seamless exception handling in
 the C programming language, drawing inspiration from the paradigm employed in C++."
arch=(x86_64)
url="https://github.com/alecksandr26/trycatch-c"
license=('MIT License')
depends=()
makedepends=(gcc git make binutils coreutils nasm)
optdepends=(valgrind)
source=("$pkgname-$pkgver.tar.gz::$url")
md5sums=('SKIP')

# Compile the source code 
build () {
    tar -xf "$basedir/$pkgname-$pkgver.tar.gz"
    cd $srcdir/$pkgname-$pkgver
    make compile
}

# Set the compiled files to create the package
# in this specific order to be able to be installed
package() {
    cd $srcdir/$pkgname-$pkgver
    mkdir -p $pkgdir/usr
    mkdir -p $pkgdir/usr/include
    mkdir -p $pkgdir/usr/lib
    
    install $srcdir/$pkgname-$pkgver/include/* $pkgdir/usr/include
    install $srcdir/$pkgname-$pkgver/lib/* $pkgdir/usr/lib
}
