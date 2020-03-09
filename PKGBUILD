# CPAN Name  : Email::Folder
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-email-folder
pkgver=0.860
pkgrel=2
pkgdesc='Perl module to read all messages from a folder as Email::Simple objects'
arch=('any')
url='https://metacpan.org/release/Email-Folder'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-email-foldertype>=0.6' 'perl-email-simple')
source=(http://search.cpan.org/CPAN/authors/id/P/PA/PALI/Email-Folder-0.860.tar.gz)
options=(!emptydirs)
md5sums=('772343c80ef52fd230d0eb684dab72b5')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd Email-Folder-0.860
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Email-Folder-0.860
	sanitize
	make test
}

package() {
	cd Email-Folder-0.860
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
