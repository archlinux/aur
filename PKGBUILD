# CPAN Name  : B::Hooks::OP::Annotation
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-b-hooks-op-annotation
pkgver=0.44
pkgrel=2
pkgdesc='Perl module that allows XS modules to annotate and delegate hooked OPs'
arch=('i686' 'x86_64')
url='https://metacpan.org/release/B-Hooks-OP-Annotation'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-extutils-depends>=0.304')
source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHOCOLATE/B-Hooks-OP-Annotation-0.44.tar.gz)
options=(!emptydirs)
md5sums=('18b1f0088850effe58ccb4a7c9dc4024')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps"
}

build() {
	cd B-Hooks-OP-Annotation-0.44
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd B-Hooks-OP-Annotation-0.44
	sanitize
	make test
}

package() {
	cd B-Hooks-OP-Annotation-0.44
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
