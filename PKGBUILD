# Maintainer: William Grieshaber <me@zee.li>
# Contributor: Anthony C <kurodroid.1@gmail.com>

pkgname=perl-iptables-chainmgr
_pkgname=IPTables-ChainMgr
pkgver=1.5
pkgrel=1
pkgdesc="IPTables::ChainMgr - Perl extension for manipulating iptables and ip6tables policies"
arch=('any')
url="http://search.cpan.org/~mrash/IPTables-ChainMgr/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'iptables' 'perl-iptables-parse' 'perl-netaddr-ip')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/M/MR/MRASH/$_pkgname-$pkgver.tar.gz)
sha512sums=('e4232cad998750397cc4104138883a8e603a0e63a065be6a0245101fe851dbabce53808ed01c200c0f8e720a90788037aeb0f11b8065cd8db0f5aef419e6a184')

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

