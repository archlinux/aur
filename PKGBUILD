# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-moosex-iterator'
pkgver='0.11'
pkgrel='1'
pkgdesc="Iterate over collections"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.86')
makedepends=()
url='http://search.cpan.org/dist/MooseX-Iterator'
source=('http://search.cpan.org/CPAN/authors/id/R/RL/RLB/MooseX-Iterator-0.11.tar.gz')
md5sums=('55ef6a39886614c5200aabbb4bdd7172')
sha512sums=('ab92f658bea542316c34a04ef4ebf44989f599993154bcfc80b827bacc85b521eb0f00a33c82670adc638fb3fd38920a869495c85524c740d40ca0937b8c03a4')
_distdir="MooseX-Iterator-0.11"

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
