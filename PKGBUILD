# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-lwp-useragent-determined'
pkgver='1.07'
pkgrel='3'
pkgdesc="a virtual browser that retries errors"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww')
makedepends=()
url='https://search.cpan.org/dist/LWP-UserAgent-Determined'
source=("https://cpan.metacpan.org/authors/id/A/AL/ALEXMV/LWP-UserAgent-Determined-${pkgver}.tar.gz")
sha512sums=('bed056468366bf86f0711a23c5bdb502a614efa2fd80d632f8d43d33295309d0ee88e439933cb3eda99192ad7d7025d0a7f6f0a53a45e79e70512771bb58ae7d')
_distdir="LWP-UserAgent-Determined-${pkgver}"

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
