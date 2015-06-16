# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-datetime-format-duration'
pkgver='1.03'
pkgrel='1'
pkgdesc="Format and parse DateTime::Durations"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0.3')
makedepends=()
url='http://search.cpan.org/dist/DateTime-Format-Duration'
source=('http://search.cpan.org/CPAN/authors/id/R/RI/RICKM/DateTime-Format-Duration-1.03a.tgz')
md5sums=('f395c9f17d8fe65aa3b3cca6c8fecf17')
sha512sums=('c34a3cbcf156cba7c8bd89e8f50d931fc6b3a313439c56aa5dda44e6445b4cdd35eb780749062d807ed6c0aa951986d40b1a02d4f900778dc2099751335a5d66')
_distdir="DateTime-Format-Duration-1.03"

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
