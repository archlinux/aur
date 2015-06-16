# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-data-messagepack'
pkgver='0.48'
pkgrel='1'
pkgdesc="MessagePack serializing/deserializing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-requires')
url='http://search.mcpan.org/dist/Data-MessagePack'
source=('http://search.mcpan.org/CPAN/authors/id/G/GF/GFUJI/Data-MessagePack-0.48.tar.gz')
md5sums=('58695f57e8bfffc22f91e9bec608bd8a')
sha512sums=('0e7875a800a9e2f4615e8948f9ca472436b6a69e768d9a61e80fb6366e8c20e12ec21b3614da9735ec5cea2e26cd43e6ed3a4c2ee21e5e230441564db0cacbc5')
_distdir="Data-MessagePack-0.48"

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
