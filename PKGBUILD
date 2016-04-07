# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-strictures'
pkgver='2.000002'
pkgrel='1'
pkgdesc="turn on strict and make most warnings fatal"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-bareword-filehandles' 'perl-indirect' 'perl-multidimensional' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/strictures'
source=('http://search.cpan.org/CPAN/authors/id/H/HA/HAARG/strictures-2.000002.tar.gz')
md5sums=('fb1fada8260992bc85e126c21ffcc6d5')
sha512sums=('30e7d02b4a240ef201e80f49066205f8563efade402bded4d0a818b0bde7c3bc5c4378e65b4e537ebd22d97ccab44e245764862eba5919770340d3811de346ef')
_distdir="strictures-2.000002"

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
