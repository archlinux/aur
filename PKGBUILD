# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-lexical-sealrequirehints'
pkgver='0.009'
pkgrel='1'
pkgdesc="prevent leakage of lexical hints"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Lexical-SealRequireHints'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/Lexical-SealRequireHints-0.009.tar.gz')
md5sums=('f8484f81710b650277f2baa55d1f1060')
sha512sums=('9c0951e23c7cb6101a9ec8c9f1577d257436204f80605eed69ed301fcca3ae745c68b7a5a226a05d80a4e7118a2ac543089b613d16096d95f9779c6250c2b9b9')
_distdir="Lexical-SealRequireHints-0.009"

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
