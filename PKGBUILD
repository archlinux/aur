# Contributor: Ordoban (<dirk.langer@vvovgonik.de>)
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-overloadinfo'
pkgver='0.007'
pkgrel='5'
pkgdesc="introspect overloaded operators"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-mro-compat>=0' 'perl-package-stash>=0.14' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='https://metacpan.org/release/Devel-OverloadInfo'
source=("https://cpan.metacpan.org/authors/id/I/IL/ILMARI/Devel-OverloadInfo-$pkgver.tar.gz")
md5sums=('3dfb74ac00c25bcd8581e402fa414e19')
sha512sums=('4db830d6f9edb467626213ab4d45b3e4b8fa9b3c38fad1349233f7b420d08be42833e57daa9a8076f4127cafba92f4cfc177ca33bd19cf2a582b644ac1ae7d72')
_distdir="Devel-OverloadInfo-$pkgver"

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
