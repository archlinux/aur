# CPAN Name  : POSIX::strftime::Compiler
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-posix-strftime-compiler
pkgver=0.44
pkgrel=1
pkgdesc='Perl module providing GNU C library compatible strftime for loggers and servers'
arch=('any')
url='https://metacpan.org/release/POSIX-strftime-Compiler'
license=('PerlArtistic' 'GPL')
depends=('perl')
makedepends=('perl-module-build-tiny>=0.035')
source=(http://search.cpan.org/CPAN/authors/id/K/KA/KAZEBURO/POSIX-strftime-Compiler-0.44.tar.gz)
options=(!emptydirs)
md5sums=('3a5ae7d56a5917410c1b661e01ed1a68')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
}

build() {
	cd POSIX-strftime-Compiler-0.44
	sanitize
	/usr/bin/perl Build.PL --installdirs vendor --destdir "$pkgdir"
	/usr/bin/perl Build
}

check() {
	cd POSIX-strftime-Compiler-0.44
	sanitize
	/usr/bin/perl Build test
}

package() {
	cd POSIX-strftime-Compiler-0.44
	sanitize
	/usr/bin/perl Build install
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
