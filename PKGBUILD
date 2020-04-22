# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: William Grieshaber <me@zee.li>
# Contributor: Anthony C <kurodroid.1@gmail.com>

pkgname=perl-iptables-chainmgr
_pkgname=IPTables-ChainMgr
pkgver=1.6
pkgrel=1
pkgdesc="IPTables::ChainMgr - Perl extension for manipulating iptables and ip6tables policies"
arch=('any')
url="http://search.cpan.org/~mrash/IPTables-ChainMgr/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'iptables' 'perl-iptables-parse' 'perl-netaddr-ip')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/M/MR/MRASH/$_pkgname-$pkgver.tar.gz)
sha512sums=('771fab2f2b8383d22f335d34b38a1b2f7deb5a10841ed005609dbe785197eff0c8be4ba4c595495525a341786a0d2173cafeb4ab6aa100582007c77bd2651c09')

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