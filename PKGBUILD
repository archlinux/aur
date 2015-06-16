# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-file-chmod'
pkgver='0.40'
pkgrel='1'
pkgdesc="Implements symbolic and ls chmod modes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/File-chmod'
source=('http://search.mcpan.org/CPAN/authors/id/X/XE/XENO/File-chmod-0.40.tar.gz')
md5sums=('dd0c2034bcb13fb7031bc1e6b416d7a7')
sha512sums=('cf477fd3128eebabc8a90ef8844555c9e7e31b827337a7fa2050043286cefb662e7ba75bee4750907b5bb6bd0fcc006796cb3a6aedd299b9566629a896a03693')
_distdir="File-chmod-0.40"

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
