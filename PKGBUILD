# Maintainer: svvac <_@svvac.net>
_pkgname=graymilter
pkgname="${_pkgname}-acme"
pkgver=2.001
pkgrel=1
pkgdesc="Blacklist mail filter module, by ACME Labs"
arch=('x86_64' 'i686')
url="http://www.acme.com/software/$_pkgname/"
license=('ACME Labs Freeware')
makedepends=( 'libmilter' )
source=("http://www.acme.com/software/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('c7498732d99927ec03e09946eae8a73e')

build() {
    cd "$_pkgname-$pkgver"
    ./configure --prefix='${DESTDIR}/usr' --sbindir='${exec_prefix}/bin'
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
