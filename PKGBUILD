# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-synopsis'
pkgver='0.06'
pkgrel='1'
pkgdesc="Test your SYNOPSIS code"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Test-Synopsis'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Test-Synopsis-0.06.tar.gz')
md5sums=('6114b3d3f354ad864d83fb8689934ca1')
sha512sums=('22084eed57bfb4878272205655a2e74eef9dc0db587063fd3e6f24b4fff04ef0e216e3efe81e5793be6120835b55e073a0dbe6ae86acf63ba813e79f8aaf930f')
_distdir="Test-Synopsis-0.06"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
