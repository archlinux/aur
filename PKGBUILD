# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-hamt'
pkgver='0.03'
pkgrel='1'
pkgdesc="hash array mapped trie"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.010')
makedepends=()
url='https://metacpan.org/release/HAMT'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/HAMT-$pkgver.tar.gz")
md5sums=('1a00cd7b669ba754da0585d680dbbadd')
sha512sums=('8906d45137fc6309afa63705c93948c1174343ec52136c4e44e8740dc9ba0f3efcc09f086379511b744232595b1c6ebf96d9c6d258f443d70cc2fa990921134c')
_distdir="HAMT-$pkgver"

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
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
