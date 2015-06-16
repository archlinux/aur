# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-config-ini'
pkgver='0.025'
pkgrel='1'
pkgdesc="simple .ini-file format"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mixin-linewise')
makedepends=()
url='https://metacpan.org/release/Config-INI'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Config-INI-0.025.tar.gz')
md5sums=('0402eb29869547dbcf03ed6f35fef3c0')
sha512sums=('2831e2611409c1f09029b37e56bcbc875051cf9ac5e458f38fbac29a3e48665f49ea9ac66519eeee71e9b52b2c702507eb801c518a8417bbf0806270b0bc4155')
_distdir="Config-INI-0.025"

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
