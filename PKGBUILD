# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-file-raw-xml'
pkgver='0.04'
pkgrel='1'
pkgdesc="an XML parser"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-file-raw>=0.18' 'perl>=5.10.0')
makedepends=()
url='https://metacpan.org/release/File-Raw-XML'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/File-Raw-XML-$pkgver.tar.gz")
md5sums=('f9fbdcf38594a7db49a81a40a3225899')
sha512sums=('0468d6c7adb0729790e4c041818abf56acc80f4c07c1b17980159f8a86b305715ef4b0897ef04e0869e8eb048caa168e521cd264fb0d2a8a2c919fc2a1b3b116')
_distdir="File-Raw-XML-$pkgver"

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
