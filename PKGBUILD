# CPAN Name  : List::Gen
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-list-gen
pkgver=0.974
pkgrel=1
pkgdesc='Perl module providing functions for generating lists'
arch=('any')
url='http://search.cpan.org/dist/List-Gen'
license=('PerlArtistic' 'GPL')
options=(!emptydirs)
depends=('perl>=5.8.6')
source=(http://search.cpan.org/CPAN/authors/id/A/AS/ASG/List-Gen-0.974.tar.gz)
md5sums=('33f0ea7028b65da38d8e3b5034c91d19')

build() {
	cd List-Gen-0.974
	PERL_MM_USE_DEFAULT=1 perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd List-Gen-0.974
	perl Build test
}

package() {
	cd List-Gen-0.974
	perl Build install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
