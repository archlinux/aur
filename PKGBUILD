# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-schedule-cron'
pkgver='1.01'
pkgrel='1'
pkgdesc="cron-like scheduler for perl subroutines"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-time-modules')
makedepends=()
url='http://search.cpan.org/dist/Schedule-Cron'
source=('http://search.cpan.org/CPAN/authors/id/R/RO/ROLAND/Schedule-Cron-1.01.tar.gz')
md5sums=('25ad6850aed878853e850c8c24d16ba1')
sha512sums=('d0066e650603c2798cf2cf5add88e75afa0f5565f60a633fd3f935bb47aa5e03c8c2df4b201f162598d42c84f537bc6221d71e45bcd5009bbee05edc95f91da7')
_distdir="${srcdir}/Schedule-Cron-1.01"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
