# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-data-compare'
pkgver='1.24'
pkgrel='1'
pkgdesc="compare perl data structures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-find-rule>=0.1')
makedepends=()
url='http://search.mcpan.org/dist/Data-Compare'
source=('http://search.mcpan.org/CPAN/authors/id/D/DC/DCANTRELL/Data-Compare-1.24.tar.gz')
md5sums=('45d56aa548581d7e4406f665c417d31e')
sha512sums=('3005dadba1c292770db363fcc951f4158bf1956a994a65afd1b4d631a505854188eefeb3f360afc719977b522014c66a749c7e898c85283de03ef76bec65a44c')
_distdir="Data-Compare-1.24"

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
