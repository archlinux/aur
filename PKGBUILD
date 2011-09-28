# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: max.bra <max.bra at alice dot it>
# Contributor: SeeSchloss <seeschloss@seos.fr>

pkgname=unoconv
pkgver=0.4
pkgrel=4
pkgdesc="Libreoffice-based document converter"
depends=('python2' 'java-runtime' 'libreoffice-common')
makedepends=('asciidoc')
arch=('any')
license=('GPL2')
url="http://dag.wieers.com/home-made/unoconv"
source=($url/$pkgname-$pkgver.tar.bz2 python_ldpath_and_doc.patch)
sha256sums=('29aad1d158989d7c9776a437495a3d67988dbcc0102aa96bcf8b2a9468455d2c'
            '3805f487729c1e8c81fd0615a9799f58a5910070f5a2273cc118fa6242007611')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np2 -i "$srcdir/python_ldpath_and_doc.patch"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
