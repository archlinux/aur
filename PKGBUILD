# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-object-insideout'
pkgver='4.05'
pkgrel='1'
pkgdesc="Comprehensive inside-out object support module"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exception-class>=1.32')
makedepends=('perl-want')
url='https://metacpan.org/release/Object-InsideOut'
source=('https://cpan.metacpan.org/authors/id/J/JD/JDHEDDEN/Object-InsideOut-4.05.tar.gz')
md5sums=('38edef7431609e67add48d3bdf70c076')
sha512sums=('0bc853766d229d8043e9829915b50c158ce2e2d12d5ba9d49d6be892979f69d675dc032163400ca1ee1a8a89db39207828981ee66f02a24a3032a21760acf87d')
_distdir="Object-InsideOut-4.05"

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
