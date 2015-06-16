# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-locale-codes'
pkgver='3.26'
pkgrel='1'
pkgdesc="a distribution of modules to handle locale codes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Locale-Codes'
source=('http://search.cpan.org/CPAN/authors/id/S/SB/SBECK/Locale-Codes-3.26.tar.gz')
md5sums=('085c6bcedc258b29512b32b425475dbc')
sha512sums=('f923d3dcc4fa66c60a99a78c6e103cc861ebe4e9884f4d7a9f0cbe7bd48fd7314040bde85db1d6c2e9046aeb8774545c708340722590c37198e25f8f66f33db8')
_distdir="Locale-Codes-3.26"

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
