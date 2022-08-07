# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Weirch Sodora <sodora at gmail dot com>

pkgname=perl-net-mac-vendor
_cpanname=Net-MAC-Vendor
_module=Net::MAC::Vendor
pkgver=1.268
pkgrel=1
pkgdesc="$_module - look up the vendor for a MAC"
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=('perl-libwww' 'perl-lwp-protocol-https' 'perl-mojolicious')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/E/ET/ETHER/${_cpanname}-${pkgver}.tar.gz")
md5sums=('01bd2053d303e554ae7005830d72cceb')

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
