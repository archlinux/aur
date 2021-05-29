# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-dom58'
pkgver='3.000'
pkgrel='1'
pkgdesc="Minimalistic HTML/XML DOM parser with CSS selectors"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/Mojo-DOM58'
source=("http://search.cpan.org/CPAN/authors/id/D/DB/DBOOK/Mojo-DOM58-$pkgver.tar.gz")
md5sums=('9b6010e91b568ffaaafa8876a1d8670b')
sha512sums=('fd44b58c1e0eb9821b456ca05d36f795d1c9fac1e262c89ba611d92b1633de241d0063f5f8d13820d45a915daea26e4aeb5dfdcc57d8744423f4c597aa4659e9')
_distdir="Mojo-DOM58-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
