# CPAN Name  : Email::MIME::CreateHTML
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-email-mime-createhtml
pkgver=1.042
pkgrel=1
pkgdesc='Perl module that allows you to create HTML emails'
arch=('any')
url='https://metacpan.org/release/Email-MIME-CreateHTML'
license=('GPL')
depends=(
	'perl-data-serializer'
	'perl-email-mime'
	'perl-file-policy'
	'perl-html-tagset'
	'perl-html-tokeparser-simple>=3.15'
	'perl-mime-types>=2.17'
	'perl-libwww'
	'perl-uri')
checkdepends=(
	'perl-test-assertions' # This requires Log::Trace
	'perl-email-address'
	'perl-email-send'
	'perl-html-treebuilder-xpath'
	'perl-mime-tools')
source=(http://search.cpan.org/CPAN/authors/id/V/VA/VANSTYN/Email-MIME-CreateHTML-1.042.tar.gz)
options=(!emptydirs)
md5sums=('e3705c7f1fb3616647dad18273575590')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd Email-MIME-CreateHTML-1.042
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Email-MIME-CreateHTML-1.042
	sanitize
	make test
}

package() {
	cd Email-MIME-CreateHTML-1.042
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
