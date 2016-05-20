# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-class-throwable'
pkgver='0.13'
pkgrel='1'
pkgdesc="A minimal lightweight exception class"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Class-Throwable'
source=('http://search.cpan.org/CPAN/authors/id/K/KM/KMX/Class-Throwable-0.13.tar.gz')
md5sums=('73f111c2bcd6bbf98ef2d3c0694ae45d')
sha512sums=('e10933973844f0b729907607a2a6eddc7825d4d0459ddaeb62568910c70ec8b32baccea2e661af6d87e748f6dd4ae11224df961351c8bc198a7d631c1b1c27df')
_distdir="Class-Throwable-0.13"

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
