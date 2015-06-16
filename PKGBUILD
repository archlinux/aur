# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-dbix-simple'
pkgver='1.35'
pkgrel='1'
pkgdesc="Very complete easy-to-use OO interface to DBI"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbi>=1.21')
makedepends=()
url='http://search.mcpan.org/dist/DBIx-Simple'
source=('http://search.mcpan.org/CPAN/authors/id/J/JU/JUERD/DBIx-Simple-1.35.tar.gz')
md5sums=('157173cc510f92315806a33abc118504')
sha512sums=('5b7e9c2f489ac32ac5833ff220dbcb7223ebfc02e3d715477c8b243c92b3563a6f2e661247793fd25764c9dd41914426b7d705bb2bcb09656d3cad552d05d301')
_distdir="DBIx-Simple-1.35"

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
