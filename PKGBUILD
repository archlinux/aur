# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cgi-compile'
pkgver='0.27'
pkgrel='2'
pkgdesc="Compile .cgi scripts to a code reference like ModPerl::Registry"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cgi>=0' 'perl-capture-tiny>=0' 'perl-file-pushd>=0' 'perl-sub-identify>=0' 'perl-sub-name>=0' 'perl-try-tiny>=0' 'perl-module-build-tiny' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-nowarnings>=0' 'perl-test-requires>=0')
url='https://metacpan.org/release/CGI-Compile'
source=('http://search.cpan.org/CPAN/authors/id/R/RK/RKITOVER/CGI-Compile-0.27.tar.gz')
md5sums=('c96eab6c8b7acc8f9950b8503e9c8e04')
sha512sums=('812e9b6474ed08560784fbb9aa24c9d4fdd57409296b5fcb06ab8d2ffc5d81c9a6728294c44c019b445181d0ce0f2d3e668dbee459b60f6408249bcb80378ea2')
_distdir="CGI-Compile-0.27"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
