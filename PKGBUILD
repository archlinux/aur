# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-engine-apache'
pkgver='1.16'
pkgrel='1'
pkgdesc="Catalyst Apache Engines"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=5.80')
makedepends=()
url='http://search.cpan.org/dist/Catalyst-Engine-Apache'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Catalyst-Engine-Apache-1.16.tar.gz')
md5sums=('7a7241dadd7c0eb28ce10aeb90c9944e')
sha512sums=('97fe7a43f97160ec6d5084168c63e4b24dd25f6430518c602da9d15a1a1b3df398b99d57b3f7430ea1705408b42ad6bd7202ec4dedbd5b899ed14b3576f69b4b')
_distdir="Catalyst-Engine-Apache-1.16"

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
