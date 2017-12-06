# Maintainer: Amish <contact at via dot aur>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-text-csv-xs'
pkgver='1.34'
pkgrel='2'
pkgdesc="comma-separated values manipulation routines"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Text-CSV_XS'
source=("http://search.cpan.org/CPAN/authors/id/H/HM/HMBRAND/Text-CSV_XS-${pkgver}.tgz")
md5sums=('30a2610d9dc720f5c920212c2ef7bd51')
sha512sums=('1a13dc0105f52997df87e9612d8696342e2823e4f871b4f5402ae6b48c1375c2eaf70f773bf32b2c176da1ba0deab34413c427013bcdf5e10322fc6901dd2b86')
_distdir="Text-CSV_XS-${pkgver}"

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
