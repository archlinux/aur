# CPAN Name  : Email::Folder
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-email-folder
pkgver=0.859
pkgrel=1
pkgdesc='Perl module to read all messages from a folder as Email::Simple objects'
arch=('any')
url='https://metacpan.org/release/Email-Folder'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.13.4' 'perl-email-foldertype>=0.6' 'perl-email-simple')
source=(http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Email-Folder-0.859.tar.gz)
options=(!emptydirs)
md5sums=('5529fb7a4c30b26bb47769c958671480')

build() {
	cd Email-Folder-0.859
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Email-Folder-0.859
	make test
}

package() {
	cd Email-Folder-0.859
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
