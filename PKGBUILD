# CPAN Name  : Plack
# Contributor: Christian Sturm <reezer@reezer.org>
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-plack
pkgver=1.0037
pkgrel=1
pkgdesc='Perl Superglue for Web frameworks and Web Servers'
arch=('any')
url='https://metacpan.org/release/Plack'
license=('PerlArtistic' 'GPL')

depends=(
	'perl>=5.10.1' # for Pod::Usage >= 1.36
	'perl-apache-logformat-compiler>=0.12'
	'perl-cookie-baker>=0.05'
	'perl-devel-stacktrace>=1.23'
	'perl-devel-stacktrace-ashtml>=0.11'
	'perl-file-sharedir>=1.00'
	'perl-filesys-notify-simple'
	'perl-http-body>=1.06'
	'perl-http-message>=5.814'
	'perl-http-headers-fast>=0.18'
	'perl-http-tiny>=0.034'
	'perl-hash-multivalue>=0.05'
	'perl-stream-buffered>=0.02'
	'perl-try-tiny'
	'perl-uri>=1.59')
makedepends=(
	'perl-extutils-makemaker>=6.30'
	'perl-file-sharedir-install>=0.06')
checkdepends=(
#	'perl-cgi-compile'
	'perl-http-request-ascgi'
	'perl-fcgi'
	'perl-fcgi-procmanager'
	'perl-http-server-simple-psgi'
	'perl-log-log4perl'
	'perl-authen-simple-passwd'
	'perl-io-handle-util'
	'perl-log-dispatch-array'
	'perl-lwp-protocol-http10'
	'perl-module-refresh'
	'perl-mime-types'
	'perl-test-tcp>=2.00')
source=(http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Plack-1.0037.tar.gz)
options=(!emptydirs)
md5sums=('bb6e8a7520524f2c40d0c322c90562ba')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd Plack-1.0037
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Plack-1.0037
	sanitize
	make test
}

package() {
	cd Plack-1.0037
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
