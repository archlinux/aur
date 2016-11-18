# Maintainer: svvac <_@svvac.net>
_pkgname=blackmilter
pkgname="${_pkgname}-acme"
pkgver=2.001
pkgrel=1
pkgdesc="Blacklist mail filter module, by ACME Labs"
arch=('x86_64' 'i686')
url="http://www.acme.com/software/$_pkgname/"
license=('ACME Labs Freeware')
makedepends=( 'libmilter' )
source=("http://www.acme.com/software/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('71a51031d66d80f0a4da22dcc10175cf')
sha256sums=('4fb64f01f9ceaa6ca730b41294fa20b2460919b567a908e2d479afd4b4be9d55')

build() {
    cd "$_pkgname-$pkgver"
    ./configure --prefix='${DESTDIR}/usr' --sbindir='${exec_prefix}/bin'
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
