# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-actionrole-matchrequestmethod'
pkgver='0.03'
pkgrel='1'
pkgdesc="Dispatch actions based on HTTP request methods"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-controller-actionrole' 'perl-catalyst-runtime>=5.80' 'perl-http-message' 'perl-moose>=1.03' 'perl-namespace-autoclean' 'perl-perl6-junction')
makedepends=()
url='http://search.cpan.org/dist/Catalyst-ActionRole-MatchRequestMethod'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Catalyst-ActionRole-MatchRequestMethod-0.03.tar.gz')
md5sums=('5343512bcdd2cff34cf944a7ffbc9f3c')
sha512sums=('cd38dae136dd41dd01569dc3447e54f7dab2845ce90ec5a0e0903419d84f605da3f100dc7c3992bde2f02549773987f583b881efc9ffd8af2173c4f9e61e4d95')
_distdir="Catalyst-ActionRole-MatchRequestMethod-0.03"

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
