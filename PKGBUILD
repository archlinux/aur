# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-safe-isa'
pkgver='1.000005'
pkgrel='1'
pkgdesc="Call isa, can, does and DOES safely on things that may not be objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Safe-Isa'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Safe-Isa-1.000005.tar.gz')
md5sums=('398246c348f404dbfc4e89dab2cbc02a')
sha512sums=('5b3fc6503dc85eb20306af5eb5b10d36a1e0d1e7cd2ff0ee361857d581e8550a194647bdbbb7fedb40b808f36afc004c51e934b62616e73ac282562dda76308e')
_distdir="Safe-Isa-1.000005"

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
