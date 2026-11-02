# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-file-raw-json'
pkgver='0.08'
pkgrel='1'
pkgdesc="Fast JSON / JSONL plugin for File::Raw"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-file-raw>=0.15' 'perl-tie-orderedhash>=0.05' 'perl>=5.10.0')
makedepends=()
url='https://metacpan.org/release/File-Raw-JSON'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/File-Raw-JSON-$pkgver.tar.gz")
md5sums=('f76ddcc918db9e62ef2a5c9fa396d1d6')
sha512sums=('3aabadccb6b279b4ce17e23a53fcad4f8156f5f445440611375d084ee88c6f2d86439a5ac875428da8dd5f60a2e3b11d86ab8683c1b0fe427fff5b2280e20c94')
_distdir="File-Raw-JSON-$pkgver"

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
