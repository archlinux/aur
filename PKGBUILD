# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-text-normalize-naco'
pkgver='0.13'
pkgrel='1'
pkgdesc="Normalize text based on the NACO rules"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-text-unidecode')
makedepends=()
url='http://search.cpan.org/dist/Text-Normalize-NACO'
source=('http://search.cpan.org/CPAN/authors/id/B/BR/BRICAS/Text-Normalize-NACO-0.13.tar.gz')
md5sums=('f4520a3dca5797b712600e2faa97073a')
sha512sums=('849ccb0c4d722936a7fbfb727e0bc56dcc7ba90f4f3079f781f68849f56a6c3c0b3e3ac880d00d514b0ecfd56967f10e18747b62a2fb1f8788e749a97d574242')
_distdir="Text-Normalize-NACO-0.13"

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
