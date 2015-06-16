# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-expect'
pkgver='1.32'
pkgrel='1'
pkgdesc="automate interactions with command line programs that expose a text terminal interface."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-tty')
makedepends=()
checkdepends=('perl-test-exception>=0.32')
url='http://search.mcpan.org/dist/Expect'
source=('http://search.mcpan.org/CPAN/authors/id/S/SZ/SZABGAB/Expect-1.32.tar.gz')
md5sums=('f71527a34d57f601d5047ad9aa98e4e4')
sha512sums=('0281d1662a902b99b5131c017b50b0456c3461c176bf4485b4bb383cab009973605514256540c5ddc2e274b5dd92ece5555719f5527d3fb8c35e83f8dc038147')
_distdir="Expect-1.32"

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
