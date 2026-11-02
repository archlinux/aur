# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-file-raw'
pkgver='0.19'
pkgrel='1'
pkgdesc="File operations using direct system calls"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.8.3')
makedepends=()
url='https://metacpan.org/release/File-Raw'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/File-Raw-$pkgver.tar.gz")
md5sums=('f60f6ebefd29390ad4c1a0700c29717e')
sha512sums=('9ef274c3d42550b37cb648c2e1c02211992044f5efda2314706e56a8d1f8f58e2f732cb57429c1925219da0a02a32019b15e8616d1fd90195e4933b8c275a645')
_distdir="File-Raw-$pkgver"

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
