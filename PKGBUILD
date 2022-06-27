# CPAN Name  : Email::LocalDelivery
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-email-localdelivery
pkgver=1.201
pkgrel=1
pkgdesc='Perl module to deliver an email to a list of mailboxes'
arch=('any')
url='https://metacpan.org/release/Email-LocalDelivery'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.8' 'perl-email-foldertype>=0.7' 'perl-email-simple>=1.998' 'perl-file-path-expand>=1.01')
checkdepends=('perl>=5.13.4' 'perl-capture-tiny')
source=(http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Email-LocalDelivery-1.201.tar.gz)
options=(!emptydirs)
md5sums=('ce108d9b905719d811b290d08f98079e')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
}

build() {
	cd Email-LocalDelivery-1.201
	sanitize
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Email-LocalDelivery-1.201
	sanitize
	make test
}

package() {
	cd Email-LocalDelivery-1.201
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
