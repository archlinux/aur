# Maintainer: svvac <_@svvac.net>
_pkgname=sfcmilter
pkgname="${_pkgname}-acme"
pkgver=2.01
pkgrel=1
pkgdesc="Sender forgery checker mail filter module, by ACME Labs"
arch=('x86_64' 'i686')
url="http://www.acme.com/software/$_pkgname/"
license=('ACME Labs Freeware')
makedepends=( 'libmilter' )
source=("http://www.acme.com/software/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('13e459153a0180d24dd6bac05e9e89b1')
sha256sums=('ba8bf56a49cf071ead25590edf4cc1f3b9f4af4765500700268edc7854b0a9f8')

build() {
    cd "$_pkgname-$pkgver"
    ./configure --prefix='${DESTDIR}/usr' --sbindir='${exec_prefix}/bin'
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
