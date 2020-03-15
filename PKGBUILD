# CPAN Name  : TeX::Encode
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-tex-encode
pkgver=2.007
pkgrel=2
pkgdesc='Perl module to encode/decode UTF-8 strings into TeX'
arch=('any')
url='https://metacpan.org/release/TeX-Encode'
license=('GPL' 'PerlArtistic')
source=(http://search.cpan.org/CPAN/authors/id/A/AT/ATHREEF/TeX-Encode-2.007.tar.gz)
depends=('perl' 'perl-html-parser' 'perl-pod-latex')
options=(!emptydirs)
md5sums=('343544c039f8f713f65ead8d95812ff4')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd TeX-Encode-2.007
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd TeX-Encode-2.007
	sanitize
	make test
}

package() {
	cd TeX-Encode-2.007
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
