# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-devel-caller'
pkgver='2.06'
pkgrel='1'
pkgdesc="meatier versions of caller"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-padwalker>=0.08')
makedepends=()
url='http://search.cpan.org/dist/Devel-Caller'
source=('http://search.cpan.org/CPAN/authors/id/R/RC/RCLAMP/Devel-Caller-2.06.tar.gz')
md5sums=('af52f47979b3c9358af9e5d8c283f263')
sha512sums=('f15a59169e191c8526f613d21c415e5d8d51b59eabf309952468fdee15277b2e8f831a2263a9dc006d9f3144a234fbc9c46ad3ab464b6fc055360c6445b209f9')
_distdir="Devel-Caller-2.06"

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
