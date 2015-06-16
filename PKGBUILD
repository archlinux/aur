# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-test-checkmanifest'
pkgver='1.28'
pkgrel='1'
pkgdesc="Check if your Manifest matches your distro"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Test-CheckManifest'
source=('http://search.cpan.org/CPAN/authors/id/R/RE/RENEEB/Test-CheckManifest-1.28.tar.gz')
md5sums=('5d26d71cede4310f7c8463cac283f5c9')
sha512sums=('5e77e1259c35be90642ef34f957119de25edf2bdea282bc3f5536cff005e9322d8220db2f3adc4d88ae71fc5e02e8a3da3b2d8341dce38afacc773e117a0ab3b')
_distdir="Test-CheckManifest-1.28"

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
