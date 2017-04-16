# Contributor: Michael Gerdau <mgd@qata.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-statistics-descriptive'
pkgver='3.0612'
pkgrel='1'
pkgdesc="Module of basic descriptive statistical functions."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-list-moreutils>=0')
makedepends=()
url='https://metacpan.org/release/Statistics-Descriptive'
source=('http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Statistics-Descriptive-3.0612.tar.gz')
md5sums=('e38cfbc1e3962d099b62a14a57a175f1')
sha512sums=('1157c0259a376f44363861c515ef56a25cf5a496d67faea546e225751d39c3529f9aa7d1bd021e2e399d5e884e7f5372df67249fe4f5607a6bdd806235503d46')
_distdir="Statistics-Descriptive-3.0612"

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
