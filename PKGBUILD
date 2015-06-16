# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-class-std-utils'
pkgver='0.0.3'
pkgrel='1'
pkgdesc="Utility subroutines for building \"inside-out\" objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Class-Std-Utils'
source=('http://search.cpan.org/CPAN/authors/id/D/DM/DMUEY/Class-Std-Utils-v0.0.3.tar.gz')
md5sums=('a919348d36b254aacbabe01d82e831b6')
sha512sums=('601a56a1b332e500283b2493ac2c46c8b7f88caeb81d771cf50848eda024464fd6b80ee7bd3b852d485001347fa939a383910fbbc2244e92b5c1b3729b0c78d3')
_distdir="Class-Std-Utils-v0.0.3"

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
