# Contributor: Mark Smith <markzzzsmith@yahoo.com.au>
pkgname=perl-data-hexdumper
_realname=Data-Hexdumper
pkgver=1.4
pkgrel=1
pkgdesc="Perl/CPAN Data::Hexdumper"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/D/DC/DCANTRELL/${_realname}-${pkgver}.tar.gz)
md5sums=('ba7e32db158d9b0b2dd5e02c5b07bda1')

build() {

	cd ${startdir}/src/${_realname}-${pkgver}

	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1

	make || return 1

	make install DESTDIR=${startdir}/pkg || return 1

	find ${startdir}/pkg -name .packlist -delete

	find $startdir/pkg -name '*.pod' -delete

}

