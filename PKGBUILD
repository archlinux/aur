# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-class-data-accessor'
pkgver='0.04004'
pkgrel='1'
pkgdesc="Inheritable, overridable class and instance data accessor creation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Class-Data-Accessor'
source=('http://search.cpan.org/CPAN/authors/id/C/CL/CLACO/Class-Data-Accessor-0.04004.tar.gz')
md5sums=('b5ea49ad12041ac8a7c1c0e111ed67d1')
sha512sums=('2e36a4227f14baab9514ca299d5d6e44b69c049d4d166b4c1a12373205ccbf6ec39c35697425b9ede07657effd283cbce2dc8a92d1d12f3ae237cfd556e26169')
_distdir="Class-Data-Accessor-0.04004"

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
