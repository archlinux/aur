# CPAN Name  : Test::Email
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname=perl-test-email
pkgver=0.07
pkgrel=3
pkgdesc='Perl package to test Email contents'
arch=('any')
url='http://search.cpan.org/dist/Test-Email'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.6.2' 'perl-mail-pop3client>=2' 'perl-mail-sendmail>=0.79' 'perl-mime-tools>=5.4')
source=(http://search.cpan.org/CPAN/authors/id/J/JA/JAMES/Test-Email-0.07.tar.gz)
options=(!emptydirs)
md5sums=('be2f80d2dbdd2f9c3329237402ebcf14')

build() {
	cd Test-Email-0.07
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Test-Email-0.07
	make test
}

package() {
	cd Test-Email-0.07
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
