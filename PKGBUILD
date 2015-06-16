# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-http-body'
pkgver='1.22'
pkgrel='1'
pkgdesc="HTTP Body Parser"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-message')
makedepends=()
checkdepends=('perl-test-deep')
url='http://search.mcpan.org/dist/HTTP-Body'
source=('http://search.mcpan.org/CPAN/authors/id/G/GE/GETTY/HTTP-Body-1.22.tar.gz')
md5sums=('81a38eab683d8750b78ad0d4845ef0d5')
sha512sums=('62665989d76699a3c3747d8f4e23d2009488bc229220bcf6fc07fc425e6ac5118f6ea48c75af681c2f29e9ed644d7a7979368cc36df77aca0544786b523c9cfe')
_distdir="HTTP-Body-1.22"

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
