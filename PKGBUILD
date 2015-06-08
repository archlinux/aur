# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-perlx-maybe'
pkgver='0.004'
pkgrel='1'
pkgdesc="return a given list only if they are all defined"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008')
makedepends=()
url='http://search.cpan.org/dist/PerlX-Maybe'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/PerlX-Maybe-0.004.tar.gz')
md5sums=('a9eeaeed0d4a5c6f5abf5709dabb418e')
sha512sums=('f03225a9025082bbda85412724d7eba4e90ae54f630fe29c081ce1f7eae77908e1cfedf619fd8a485f5ed67539a8d135e02df3eb136c4d1f53ffabeb97fe032f')
_distdir="PerlX-Maybe-0.004"

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
