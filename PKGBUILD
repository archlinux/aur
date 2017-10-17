# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-html-tidy'
pkgver='1.60'
pkgrel='1'
pkgdesc="Perl/CPAN Module HTML:Tidy: (X)HTML validation in a Perl object"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'tidyp')
makedepends=()
url='https://metacpan.org/release/HTML-Tidy'
source=("http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/HTML-Tidy-$pkgver.tar.gz")
md5sums=('03bafb9a0a2a23629cf9649abb2b72ab')
sha512sums=('0ddad3d7a13054148ad32b9337c8f17d6112140747b8d3a6e632cdc5d90fbebe0ce9d94ea7ba1eacd353d7e6c60d93875e950ed9c2ed52b16677dd33eed7288f')
_distdir="HTML-Tidy-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
