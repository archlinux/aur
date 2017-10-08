# Contributor: nous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-unicode-maputf8'
pkgver='1.11'
pkgrel='1'
pkgdesc="Conversions to and from arbitrary character sets and UTF8"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-jcode>=0' 'perl-unicode-map>=0' 'perl-unicode-map8>=0' 'perl-unicode-string>=0')
makedepends=()
url='https://metacpan.org/release/Unicode-MapUTF8'
source=('http://search.cpan.org/CPAN/authors/id/S/SN/SNOWHARE/Unicode-MapUTF8-1.11.tar.gz')
md5sums=('16e66ee0bdc0e6cc9c36e29212d8ffdc')
sha512sums=('6af57450761fcff70006537bb37df1769d8868178c1664c75905307c976bfda76afb57d4808612434939afe90a9f254a4e380115e201c78d1b3a64c8eeba9fc4')
_distdir="Unicode-MapUTF8-1.11"

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
