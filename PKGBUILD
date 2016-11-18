# Maintainer: svvac <_@svvac.net>
_pkgname=graymilter
pkgname="${_pkgname}-acme"
pkgver=2.001
pkgrel=1
pkgdesc="Simple graylist mail filter module, by ACME Labs"
arch=('x86_64' 'i686')
url="http://www.acme.com/software/$_pkgname/"
license=('ACME Labs Freeware')
makedepends=( 'libmilter' )
source=("http://www.acme.com/software/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('c7498732d99927ec03e09946eae8a73e')
sha256sums=('b11cd788d757618b1abf165d10665df0257e09bbed2eda51c94b80b3ccdaf5d3')

build() {
    cd "$_pkgname-$pkgver"
    ./configure --prefix='${DESTDIR}/usr' --sbindir='${exec_prefix}/bin'
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
