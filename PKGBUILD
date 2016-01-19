# Maintainer: William Grieshaber <me@zee.li>
# Contributor: Anthony C <kurodroid.1@gmail.com>
# Contributor: Weirch Sodora <sodora@gmail.com>

pkgname=perl-iptables-parse
_pkgname=IPTables-Parse
pkgver=1.6.1
pkgrel=1
pkgdesc="IPTables::Parse - Perl extension for parsing iptables and ip6tables firewall rulesets"
arch=('any')
url="http://search.cpan.org/~mrash/IPTables-Parse/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'iptables')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/M/MR/MRASH/$_pkgname-$pkgver.tar.gz)
sha512sums=('7638665e34f06771519bc8989ad57b6308c5efb39ecb32f3f6f208d0ece1675f499452f4b4b5b2ddd25109abecbdb5015e4441431defa8688f33f9eb2ad921eb')

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
