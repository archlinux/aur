# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-aliased'
pkgver='0.34'
pkgrel='1'
pkgdesc="Use shorter versions of class names."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/aliased'
source=('http://search.mcpan.org/CPAN/authors/id/E/ET/ETHER/aliased-0.34.tar.gz')
md5sums=('f7f659f689699a87115da1262eb6edc6')
sha512sums=('65bc3f6401a0c2119105261112a3d9612abb98c874cd3409c6a1a9a0974aae902f30b6041121be6a74ee28584cf0c7ef506fe8318ab35ac550f70b4b387744f6')
_distdir="aliased-0.34"

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
