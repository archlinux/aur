# Maintainer: Weirch Sodora <sodora at gmail dot com>

pkgname=perl-net-mac-vendor
_cpanname=Net-MAC-Vendor
_module=Net::MAC::Vendor
pkgver=1.23
pkgrel=1
pkgdesc="$_module - look up the vendor for a MAC"
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=('perl-libwww' 'perl-lwp-protocol-https')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/B/BD/BDFOY/${_cpanname}-${pkgver}.tar.gz")
md5sums=('bfbdbca033512803c9da47e4ae3b39de')

build() {
    cd $_cpanname-$pkgver
    perl Makefile.PL INSTALLDIRS=vendor
    make
}

check() {
    cd $_cpanname-$pkgver
    make test
}

package() {
    cd $_cpanname-$pkgver
    make DESTDIR="$pkgdir" install
}
