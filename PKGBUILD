# Maintainer: Asger Weirsøe <asger@weirsoe.dk>
# Contributer: Alex Garcia <thekyz@gmail.com>
pkgname=jobber
pkgver=1.4.0
pkgrel=1
epoch=
pkgdesc='jobber'
arch=('x86_64')
url='http://dshearer.github.io/jobber/'
license=('MIT')
md5sums=('8741abd53187b54e6f92fbcd0ca3afe3')
install='.install'
source=("https://github.com/dshearer/jobber/releases/download/v$pkgver/$pkgname-$pkgver-1.el7.$arch.rpm")

build() {
    cd $srcdir
    bsdtar -xf ../$pkgname-$pkgver-1.el7.$arch.rpm
}

package() {
    mkdir -p $pkgdir/usr/local
    mkdir -p $pkgdir/usr/bin

    mv $srcdir/usr/lib $pkgdir/usr/lib
    mv $srcdir/usr/local/bin/jobber $pkgdir/usr/bin/
    mv $srcdir/usr/local/libexec/ $pkgdir/usr/local
}

