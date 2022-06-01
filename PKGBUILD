# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-class-role'
pkgver='0.04'
pkgrel='2'
pkgdesc="Support for the role object model"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Class-Role'
source=("https://cpan.metacpan.org/authors/id/N/NE/NEILB/Class-Role-$pkgver.tar.gz")
md5sums=('171c58f2d584f8d80097df26359c070c')
sha512sums=('354ffe10d68ece47ca743a6603f02e82b72a8b78ea25f1125502561ca379ab25985e00dad72a3bb02d199a942e409c78c4450cffdf3d17c7bbe2a2c83db036b0')
_distdir="Class-Role-$pkgver"

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
