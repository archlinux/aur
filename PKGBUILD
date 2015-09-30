# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-software-license'
pkgver='0.103010'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-section' 'perl-sub-install' 'perl-text-template' 'perl-try-tiny')
makedepends=()
url='https://metacpan.org/release/Software-License'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Software-License-0.103010.tar.gz')
md5sums=('eee95f8d67472fa1a12cdf81e676812b')
sha512sums=('d30564974a333b1ab8d7dc0eea9f740e415b4e7a2e736ceabf97ab6b481855e8ea5786be9e197edd1c1adb601d886461f2ad680714045ea802497c3c23046ae4')
_distdir="Software-License-0.103010"

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
