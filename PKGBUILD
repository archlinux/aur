# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-config-mvp-reader-ini'
pkgver='2.101464'
pkgrel='1'
pkgdesc="an MVP config reader for .ini files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-config-ini' 'perl-config-mvp' 'perl-moose')
url='https://metacpan.org/release/Config-MVP-Reader-INI'
source=(https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Config-MVP-Reader-INI-$pkgver.tar.gz)
sha256sums=('3994b05e414416ac06982a3faf4296c53fb96f30c851a182f42dd4e3cf7481c0')
_distdir="Config-MVP-Reader-INI-$pkgver"

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
