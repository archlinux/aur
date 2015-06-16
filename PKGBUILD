# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-bareword-filehandles'
pkgver='0.003'
pkgrel='2'
pkgdesc="disables bareword filehandles"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-hooks-op-check' 'perl-lexical-sealrequirehints' 'perl')
makedepends=('perl-extutils-depends')
url='https://metacpan.org/release/bareword-filehandles'
source=('http://search.cpan.org/CPAN/authors/id/I/IL/ILMARI/bareword-filehandles-0.003.tar.gz')
md5sums=('1e0ec0e72c897b238b4f9d0eb71643a4')
sha512sums=('184c37f737a638a3cfad7657b39918a2aff862faa7c84ef965cc9f2a7c157b05eac732807a0ebb1de44a0ce76b72a96016a126cbba658cddd8230f3de6ab5d8b')
_distdir="bareword-filehandles-0.003"

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
