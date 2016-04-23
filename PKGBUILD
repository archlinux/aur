# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-validate-tiny'
pkgver='1.551'
pkgrel='1'
pkgdesc="Minimalistic data validation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-list-moreutils')
makedepends=()
url='https://metacpan.org/release/Validate-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MINIMAL/Validate-Tiny-1.551.tar.gz')
md5sums=('3dc67956003849aea1f55dfebbccd1de')
sha512sums=('541d48b13fe6fe55a30893e82daabad6119cabf93d0825ffcb6f32d629784a8ecc7b47e2b534bc3465c7441cc7640209860388b144e8c766b9bce1658d4cde6d')
_distdir="Validate-Tiny-1.551"

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
