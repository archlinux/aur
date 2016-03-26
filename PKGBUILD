# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lexical-sealrequirehints'
pkgver='0.010'
pkgrel='1'
pkgdesc="prevent leakage of lexical hints"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Lexical-SealRequireHints'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/Lexical-SealRequireHints-0.010.tar.gz')
md5sums=('a02f013b3e7c4a0e44a25dbcbdfd4aa1')
sha512sums=('4c71a22397ae689349bf45c1b2177108008158052b341f9d9b09e5d97c55cd538bb427c041389c4edf8584be292bf4b1f42abdff573510a0a64fb69e5166aecd')
_distdir="Lexical-SealRequireHints-0.010"

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
