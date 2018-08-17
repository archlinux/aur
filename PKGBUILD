# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-b-keywords'
pkgver='1.18'
pkgrel='1'
pkgdesc="Lists of reserved barewords and symbol names"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/B-Keywords'
source=('http://search.mcpan.org/CPAN/authors/id/R/RU/RURBAN/B-Keywords-1.18.tar.gz')
md5sums=('a9f13ca16c6e6d773d55847abb9dd795')
sha512sums=('b1a6b4f8d1a557168257c4b8648e5f0e98e91dde7ba9122ba9a99cfb8b399a6857a2ee005ff26c4908d7f01e1e2ffb1dafae3aa6fe5acd3773588911ef159ff4')
_distdir="B-Keywords-1.18"

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
