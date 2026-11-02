# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-template-stencil'
pkgver='0.13'
pkgrel='1'
pkgdesc="a fast template engine"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-eshu>=0.13' 'perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/Template-Stencil'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Template-Stencil-$pkgver.tar.gz")
md5sums=('20998cd63a448319e601966c6278b5f8')
sha512sums=('d9555a15b1f82217f569db163c070a6a5b90c186589d74ff6381e8aaa9bda9604eff7c5ed24cbdad448a380c8d701795c40b87b59e368a8089d0b299c291f70f')
_distdir="Template-Stencil-$pkgver"

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
