# Contributor: Tyler Swagar <buttpickle69@shaw.ca>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojolicious'
pkgver='8.06'
pkgrel='1'
pkgdesc="Real-time web framework"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/Mojolicious'
source=("https://cpan.metacpan.org/authors/id/S/SR/SRI/Mojolicious-${pkgver}.tar.gz")
md5sums=('001075411d8bc033ead894ff600d6a9f')
sha512sums=('a08ba9727e53b3d298e186a8eb6c1f8936b3e82af027bdfbaa9d3a803ddeebf42596260f560a3a034e40d6cf0349bd1a9f1215fe8cf90694c27f70b488d411bd')
_distdir="Mojolicious-${pkgver}"

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
