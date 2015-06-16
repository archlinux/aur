# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-template-tiny'
pkgver='1.12'
pkgrel='1'
pkgdesc="Template Toolkit reimplemented in as little code as possible"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Template-Tiny'
source=('http://search.mcpan.org/CPAN/authors/id/A/AD/ADAMK/Template-Tiny-1.12.tar.gz')
md5sums=('166662a3d24c1c5f995c2ffc26e0eb36')
sha512sums=('056b3dcffea92533b0c61423edede96654a98d9a2bed13753b03e3dc2849ba2c5d41607cb604b8752909cb07771d152e3c3c90f514f7eccaebd60b34bc270da2')
_distdir="Template-Tiny-1.12"

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
