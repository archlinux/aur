# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-padwalker'
pkgver='2.1'
pkgrel='1'
pkgdesc="play with other peoples' lexical variables"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/PadWalker'
source=('http://search.cpan.org/CPAN/authors/id/R/RO/ROBIN/PadWalker-2.1.tar.gz')
md5sums=('fdd962c6e519aad58606997d11448fd3')
sha512sums=('632100ef9f13def71aa496737d6a49977d311cae749a1b4827f2b965ae797357fbb5ab756ead0927f200ba8a8a62a9b6fcce3a49f3cc0c4e196855d8427502d3')
_distdir="PadWalker-2.1"

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
