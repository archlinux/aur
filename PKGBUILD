# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-extutils-builder'
pkgver='0.020'
pkgrel='1'
pkgdesc="An abstract representation of build processes"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-extutils-config>=0.009' 'perl-extutils-helpers>=0.027' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/ExtUtils-Builder'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/ExtUtils-Builder-$pkgver.tar.gz")
md5sums=('a43cdee974b51505da7afd1b619447b6')
sha512sums=('7520e4bda0d63417697847317da814f1e533edaa29ef7c8e59a3401b362d105a3ff706e2bb7ba8a5ec3770156c331a311c4656c764632e052d6e666fae9137fb')
_distdir="ExtUtils-Builder-$pkgver"

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
