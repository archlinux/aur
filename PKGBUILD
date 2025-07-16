# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: James Pearson <james.m.pearson+arch@gmail.com>

pkgname=perl-digest-md4
pkgver=1.9
pkgrel=12
pkgdesc='Digest::MD4::Perl - Perl interface to the MD4 Algorithm'
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/Digest-MD4'
license=('GPL' 'PerlArtistic')
depends=('perl')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIKEM/DigestMD4/Digest-MD4-${pkgver}.tar.gz")
sha256sums=('665110bba32470f398f311cd6462fd8975d7c83675ff674bc2f6c7b72b0caaa6')

build() {
	cd "${srcdir}/Digest-MD4-${pkgver}"

	# install module in vendor directories.
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

package() {
	cd "${srcdir}/Digest-MD4-${pkgver}"

	make install DESTDIR="${pkgdir}/"

	# remove perllocal.pod and .packlist
	find "${pkgdir}" -name perllocal.pod -delete
	find "${pkgdir}" -name .packlist -delete
}

