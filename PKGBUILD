# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-perl-critic-progressive'
pkgver='0.03'
pkgrel='1'
pkgdesc="Encourage Perl::Critic conformance over time."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-critic>=1.082')
makedepends=()
url='http://search.cpan.org/dist/Test-Perl-Critic-Progressive'
source=('http://search.cpan.org/CPAN/authors/id/T/TH/THALJEF/Test-Perl-Critic-Progressive-0.03.tar.gz')
md5sums=('9d98e61592571c379e8d598db01fcc0a')
sha512sums=('09ed6a434647d11b6d310b60ddce6d37e06f1a94c3c8dc6986f4b945270681059dcd260fcc8fe33f987bd954d3d59dec4cd19bd432054774eed226ae72202ee1')
_distdir="Test-Perl-Critic-Progressive-0.03"

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
