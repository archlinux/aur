# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-dns-zoneedit'
pkgver='1.1'
pkgrel='1'
pkgdesc="Update your ZoneEdit dynamic DNS records"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww')
makedepends=()
url='http://search.cpan.org/dist/DNS-ZoneEdit'
source=('http://search.cpan.org/CPAN/authors/id/E/EG/EGILES/DNS-ZoneEdit-1.1.tar.gz')
md5sums=('a159edf49d8ffff980923ee5f150a203')
sha512sums=('2ece9ee481813851982ddc730d54f82843afe2c13500d21fbb6dcfa0c150654d2f88bf5d7ad39f0d2b61498eb3e8dcdd9ecffb2ceadc82ac2a828ec0a48d5f82')
_distdir="DNS-ZoneEdit-1.1"

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
