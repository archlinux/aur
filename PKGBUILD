# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-safe-isa'
pkgver='1.000010'
pkgrel='1'
pkgdesc="Perl/CPAN Module Safe::Isa: Call isa, can, does and DOES safely on things that may not be objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Safe-Isa'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Safe-Isa-${pkgver}.tar.gz")
md5sums=('f68579f6acfeb2e19d7d9a65100399d8')
sha512sums=('121288c7c59d97f4e48c1e50795d835cac0638a1edb1116876813cc2fe955efced9916222f6b16e4c1dbd5149c9d68c19bc77584f999c411e4c22e2f28ea1838')
_distdir="Safe-Isa-${pkgver}"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
