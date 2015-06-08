# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-icon-famfamfam-silk'
pkgver='0.002001003'
pkgrel='1'
pkgdesc="embed these famous icons in your code"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-uri')
makedepends=()
url='http://search.cpan.org/dist/Icon-FamFamFam-Silk'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/Icon-FamFamFam-Silk-0.002001003.tar.gz')
md5sums=('f3daa54d112f7519013541be6060fbc7')
sha512sums=('c634867feafd6e89e041cc7dac92fdf62ce94bb0b9f1195b93fcca911426e9fc8c4115b9b19010c1fec9314557823639c82b9232ec2d65fc81dafa561bc076a4')
_distdir="Icon-FamFamFam-Silk-0.002001003"

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
