# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-mojolicious'
pkgver='6.16'
pkgrel='1'
pkgdesc="Real-time web framework"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Mojolicious'
source=('http://search.cpan.org/CPAN/authors/id/S/SR/SRI/Mojolicious-6.16.tar.gz')
md5sums=('da05110bf02c5dcaa99c3d91079de0f1')
sha512sums=('ce089911c1068dca8c440fafafca256c6f0157a406ef94ecf939a0a65fb086111296189cbf68d9a36fbcd9ad1e7fd3989fddcfb82cd7e3b428f46808446e87e5')
_distdir="Mojolicious-6.16"

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
