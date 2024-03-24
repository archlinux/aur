# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-travel-status-de-iris'
pkgver='1.96'
pkgrel='1'
pkgdesc="Interface to IRIS based web departure monitors."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0' 'perl-datetime>=0' 'perl-datetime-format-strptime>=0' 'perl-gis-distance>=0' 'perl-lwp-protocol-https>=0' 'perl-list-compare>=0.29' 'perl-list-moreutils>=0' 'perl-list-utilsby>=0' 'perl-text-levenshteinxs>=0' 'perl-xml-libxml>=0' 'perl-libwww>=0' 'perl>=5.14.2')
makedepends=('perl-file-slurp>=9999.19' 'perl-json>=0' 'perl-module-build>=0.4' 'perl-test-compile>=0' 'perl-test-fatal>=0' 'perl-test-number-delta>=0' 'perl-test-pod>=0' 'perl-text-csv>=0')
url='https://metacpan.org/release/Travel-Status-DE-IRIS'
source=('http://search.cpan.org/CPAN/authors/id/D/DE/DERF/Travel-Status-DE-IRIS-1.96.tar.gz')
md5sums=('897713ea63ecf3e6b359f887512674ec')
sha512sums=('0ff07d63c810583a6ebf7a5e691e9d52fa17aa2873df75595520f2d46728ff6f45efbdad3e7167e60fff7df5a60b56916f62a2369e117c3f4f029ff35b78f58a')
_distdir="Travel-Status-DE-IRIS-1.96"

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
