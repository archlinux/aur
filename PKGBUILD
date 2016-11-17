# Maintainer: svvac <_@svvac.net>
_pkgname=spfmilter
pkgname="${_pkgname}-acme"
pkgver=2.001
pkgrel=1
pkgdesc="Sender POlicy Framework mail filter module, by ACME Labs"
arch=('x86_64' 'i686')
url="http://www.acme.com/software/$_pkgname/"
license=('ACME Labs Freeware')
depends=( 'libspf2' )
makedepends=( 'libmilter' )
source=("http://www.acme.com/software/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('29d9aedc959264fd793bc6095e4bdf83')

build() {
    cd "$_pkgname-$pkgver"
    ./configure --prefix='${DESTDIR}/usr' --sbindir='${exec_prefix}/bin'
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
