# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-module-load-conditional'
pkgver='0.54'
pkgrel='1'
pkgdesc="Looking up module information / loading at runtime"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Module-Load-Conditional'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/Module-Load-Conditional-0.54.tar.gz')
md5sums=('626d90b25bd461388e4706ff7a631d72')
sha512sums=('52298f34afd9bcc1ac748ccc2fcbc2d06b811e1bfc14d56508842703784b08a372d4b742041dc70689a80c2baad4a0a92bdb95ba7e5ab626c9e7c827f0bfc780')
_distdir="Module-Load-Conditional-0.54"

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
