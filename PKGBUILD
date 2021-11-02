# Contributor: Ordoban <dirk-langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-regexp-stringify'
pkgver='0.06'
pkgrel='1'
pkgdesc="Stringify a Regexp object"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/Regexp-Stringify'
source=("https://cpan.metacpan.org/authors/id/P/PE/PERLANCAR/Regexp-Stringify-$pkgver.tar.gz")
md5sums=('c5e8de8a5614181e7d7ec304e5b4a93f')
sha512sums=('9bb186e52528306375e218b2dbd81c1a407cbbd83f6ab6a0028fcda7f731d5da9d8a651af70966ea5fa356481c8216971a5500a7acbee29743faa1d28d6003a7')
_distdir="Regexp-Stringify-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
