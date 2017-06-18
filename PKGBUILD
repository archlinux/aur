# CPAN Name  : Clipboard
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-clipboard
pkgver=0.13
pkgrel=4
pkgdesc='Perl clipboard module'
arch=('any')
url='https://metacpan.org/release/Clipboard'
license=('PerlArtistic' 'GPL')
makedepends=('perl-module-install')
depends=('perl>=5.6.0' 'xclip')
source=(http://search.cpan.org/CPAN/authors/id/K/KI/KING/Clipboard-0.13.tar.gz)
options=(!emptydirs)
md5sums=('691e17df1d4c074284c85abac6c0c973')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd Clipboard-0.13
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Clipboard-0.13
	sanitize
	make test
}

package() {
	cd Clipboard-0.13
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
