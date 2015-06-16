# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-uri-escape-xs'
pkgver='0.10'
pkgrel='1'
pkgdesc="Drop-In replacement for URI::Escape"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/URI-Escape-XS'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DANKOGAI/URI-Escape-XS-0.10.tar.gz')
md5sums=('23453334534498de37a758de3b077793')
sha512sums=('a7288c712cddf2e0a9766d3a0d56bd0c63a078e13c4eb80226fb5b67f0b8d7a7217d65e4bf0b4bb1130c8a0794fa286d808d57283dae6aea994e2c30b86c363b')
_distdir="URI-Escape-XS-0.10"

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
