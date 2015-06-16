# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-method-signatures-simple'
pkgver='1.07'
pkgrel='1'
pkgdesc="Basic method declarations with signatures, without source filters"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-declare>=0.003001')
makedepends=()
url='https://metacpan.org/release/Method-Signatures-Simple'
source=('http://search.cpan.org/CPAN/authors/id/R/RH/RHESA/Method-Signatures-Simple-1.07.tar.gz')
md5sums=('53b315b6debda04b31e9323ff227999b')
sha512sums=('1ac0374edb7827711c7d760390b6facece85fcf9befa7d76b5fbf08b8b9903474676a0b34181cca4244eea8be5c93706a122833eed38a1f8d4af7017d8f58abe')
_distdir="Method-Signatures-Simple-1.07"

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
