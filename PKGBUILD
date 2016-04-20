# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-astro-suntime'
pkgver='0.01'
pkgrel='1'
pkgdesc="Get Sun Rise and Set Times for any location on the globe"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-time-parsedate')
makedepends=()
url='https://metacpan.org/release/Astro-SunTime'
source=('http://search.cpan.org/CPAN/authors/id/R/RO/ROBF/Astro-SunTime-0.01.tar.gz')
md5sums=('4657927a49604494bfaaa153663b90b9')
sha512sums=('be14637e9f2a1f310f645f9e2e9f2cda484ac63a8e7acfa7d02cb312c4d5f8b21bcf6da2ea43d05152b3797c3c0f623ec65f649b70975b8c2eb99a8b86ca5213')
_distdir="Astro-SunTime-0.01"

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
