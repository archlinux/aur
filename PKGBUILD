# Maintainer: Anthony C <kurodroid.1@gmail.com>
# Contributor: Weirch Sodora <sodora@gmail.com>

pkgname=perl-iptables-parse
_pkgname=IPTables-Parse
pkgver=1.5
pkgrel=0
pkgdesc="IPTables::Parse - Perl extension for parsing iptables and ip6tables firewall rulesets"
arch=('any')
url="http://search.cpan.org/~mrash/IPTables-Parse/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'iptables')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/M/MR/MRASH/$_pkgname-$pkgver.tar.gz)
md5sums=('009e1bd3cfa0621d26c63d1e75ede8f3')

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
