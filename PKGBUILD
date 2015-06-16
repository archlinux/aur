# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-data-serializer'
pkgver='0.60'
pkgrel='1'
pkgdesc="Modules that serialize data structures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Data-Serializer'
source=('http://search.mcpan.org/CPAN/authors/id/N/NE/NEELY/Data-Serializer-0.60.tar.gz')
md5sums=('6ca3a58bad4691938b485b9c800aa5cc')
sha512sums=('85211d2ca5db19219f89da5300b93835866baa5e12237efa61ea82d2b841f6b5a05bca889d98878151d1f7517b2af5d9a1535e7bbcd64245936b270a82be21bb')
_distdir="Data-Serializer-0.60"

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
