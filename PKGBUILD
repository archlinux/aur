# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-class-c3-xs'
pkgver='0.13'
pkgrel='1'
pkgdesc="XS speedups for Class::C3"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Class-C3-XS'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Class-C3-XS-0.13.tar.gz')
md5sums=('92a48fe74206b803315749de29c30b88')
sha512sums=('01adf028b0f08b3d3650d9c81198a17348c724dc4761feb06f1464fb82a3d8c864b7fa5bcd8d2159d9c6763736f5e7677711b5d4408481f694f5c16274df0a1c')
_distdir="Class-C3-XS-0.13"

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
