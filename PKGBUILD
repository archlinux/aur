# CPAN Name  : Cache::Simple::TimedExpiry
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-cache-simple-timedexpiry
pkgver=0.27
pkgrel=2
pkgdesc='Perl package providing a lightweight cache with timed expiration'
arch=('any')
url='https://metacpan.org/release/Cache-Simple-TimedExpiry'
license=('PerlArtistic' 'GPL')
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/Cache-Simple-TimedExpiry-0.27.tar.gz)
options=(!emptydirs)
md5sums=('4ef124ab7776f3c257b9ffbed917e67a')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps"
}

build() {
	cd Cache-Simple-TimedExpiry-0.27
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Cache-Simple-TimedExpiry-0.27
	sanitize
	make test
}

package() {
	cd Cache-Simple-TimedExpiry-0.27
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
