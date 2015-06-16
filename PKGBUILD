# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-tap-harness-archive'
pkgver='0.15'
pkgrel='1'
pkgdesc="Create an archive of TAP test results"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-yaml-tiny')
makedepends=()
url='http://search.cpan.org/dist/TAP-Harness-Archive'
source=('http://search.cpan.org/CPAN/authors/id/S/SC/SCHWIGON/TAP-Harness-Archive-0.15.tar.gz')
md5sums=('1fbf09c898f8d847da2c7ad7ea915b16')
sha512sums=('809340fc0071bd24dd4fd68bbdf4e4d4e1c2e56647b858af4e5b0f19101707dd1e4d5ea5b3214db2a815fe533a3a82ee5f6183b209a9f6af0a36e9edd83f5bf0')
_distdir="TAP-Harness-Archive-0.15"

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
