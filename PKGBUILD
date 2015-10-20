# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-file-chmod'
pkgver='0.42'
pkgrel='1'
pkgdesc="Implements symbolic and ls chmod modes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/File-chmod'
source=('http://search.cpan.org/CPAN/authors/id/X/XE/XENO/File-chmod-0.42.tar.gz')
md5sums=('b94807f4bef13506ee529a214524f9de')
sha512sums=('1b6bc41c43434914c0cb160a063f4cc6cbdfef85233b962c5a6885a23aebd7cafe05eb2d59253c7dc7f1cd323cdd3888d82a6ce19a9b7a00aaa8212d40c064d8')
_distdir="File-chmod-0.42"

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
