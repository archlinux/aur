# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-eshu'
pkgver='0.14'
pkgrel='1'
pkgdesc="indentation fixer and syntax highlighter for C, Perl, XS, XML, HTML,"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.8.3')
makedepends=()
url='https://metacpan.org/release/Eshu'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Eshu-$pkgver.tar.gz")
md5sums=('5dc9ec912d3f697dc0f56c9b3876046e')
sha512sums=('e4a414030d7ca12d8ee3c53a94748f88f831c109eedf3e87b5b9650f8e27665edcda17c97773c080742e094a501763fc4b6c368b0242d8c53ae6180bc4a0dba2')
_distdir="Eshu-$pkgver"

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
