# CPAN Name  : Set-Scalar
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-set-scalar'
pkgver='1.29'
pkgrel='1'
pkgdesc="basic set operations"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Set-Scalar'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAVIDO/Set-Scalar-1.29.tar.gz')
md5sums=('4af73c0d6f562d1eddd4ebf6014ac67f')
sha512sums=('ee77f72a237ed7d3f0467395009b00163c33e095fe5e8bdc971c8cd0eee8dbc825c83ab486e6f54ed6c1aedf1539cde9d9b1a54b8be703d5dc01ee48017ce45c')
_distdir="Set-Scalar-1.29"

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
