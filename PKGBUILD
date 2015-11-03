# Contributor: Anthony C <kurodroid.1@gmail.com>

pkgname=perl-iptables-chainmgr
_pkgname=IPTables-ChainMgr
pkgver=1.4
pkgrel=0
pkgdesc="IPTables::ChainMgr - Perl extension for manipulating iptables and ip6tables policies"
arch=('any')
url="http://search.cpan.org/~mrash/IPTables-ChainMgr/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'iptables' 'perl-iptables-parse' 'perl-netaddr-ip')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/M/MR/MRASH/$_pkgname-$pkgver.tar.gz)
md5sums=('f322a583ef49c82c0807237542ed5f35')

build() {
    cd  $_pkgname-$pkgver
    perl Makefile.PL INSTALLDIRS=vendor
    make
}

check() {
    cd $_pkgname-$pkgver
    make test
}

package() {
    cd $_pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}

