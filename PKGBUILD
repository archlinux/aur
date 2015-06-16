# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-lwp-useragent-determined'
pkgver='1.06'
pkgrel='1'
pkgdesc="a virtual browser that retries errors"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww')
makedepends=()
url='http://search.cpan.org/dist/LWP-UserAgent-Determined'
source=('http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/LWP-UserAgent-Determined-1.06.tar.gz')
md5sums=('3485fe63fba0b3f7d23370f5a31496dc')
sha512sums=('05c85e923b7e2a643455242da2785743be6a1889200a1a922e81fd882943ad136cd4050d96e24af1b60000e264272e5b1fd04e95e8113923f412494adceb4f66')
_distdir="LWP-UserAgent-Determined-1.06"

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
