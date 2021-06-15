# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: scj <scj archlinux us>

pkgname=dnuos
pkgver=1.0.11
pkgrel=6
pkgdesc='Music library list creator'
arch=(any)
url='https://bitheap.org/dnuos'
license=('GPL')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://bitheap.org/dnuos/files/$pkgname-$pkgver.tar.gz")
md5sums=('bbd14149547c527086624cf55f852d69')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}