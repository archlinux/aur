# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-pod2-base'
pkgver='0.043'
pkgrel='1'
pkgdesc="Base module for translations of Perl documentation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/POD2-Base'
source=('http://search.mcpan.org/CPAN/authors/id/F/FE/FERREIRA/POD2-Base-0.043.tar.gz')
md5sums=('aa72bc2e4f487427f380e0ef9a10f3e8')
sha512sums=('d535faae9f6722bc8defc016d5b13c8cd251589a28d244feb4394a1ad6235d4e95651e3dc87d13e424e32a54930528c9cf817f65f2eb56ecf53493570450b443')
_distdir="POD2-Base-0.043"

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
