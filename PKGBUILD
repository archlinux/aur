# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=perl-anyevent-snmp
pkgver=6.0
pkgrel=1
pkgdesc="Adaptor to integrate Net::SNMP into AnyEvent"
arch=('i686' 'x86_64')
url='http://search.cpan.org/perldoc?AnyEvent::SNMP'
license=('PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/AnyEvent-SNMP-${pkgver}.tar.gz")
depends=('perl-net-snmp' 'perl-anyevent')
md5sums=('1112752d9df30da320116788372c64e3')

build() {
	cd "$srcdir/AnyEvent-SNMP-$pkgver"

	# install module in vendor directories
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
	make install DESTDIR="$pkgdir/"

	#remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
}
