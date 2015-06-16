# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-moosex-markasmethods'
pkgver='0.15'
pkgrel='1'
pkgdesc="Mark overload code symbols as methods"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-hooks-endofscope' 'perl-moose>=0.94' 'perl-namespace-autoclean>=0.12')
makedepends=()
url='http://search.cpan.org/dist/MooseX-MarkAsMethods'
source=('http://search.cpan.org/CPAN/authors/id/R/RS/RSRCHBOY/MooseX-MarkAsMethods-0.15.tar.gz')
md5sums=('7f8ed6a2e5ae4bb8e00e4952dc98078d')
sha512sums=('be4de7bc7650ecdda18a9b0ac90bcf74200c09691680078c2750d234a8523a6c0ec1701067461b42f08730f02729f1401b47af56cdb8364c1033df3ea9c18078')
_distdir="MooseX-MarkAsMethods-0.15"

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
