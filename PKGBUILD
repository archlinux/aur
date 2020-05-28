# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname=perl-hash-merge-simple
_pkgname=Hash-Merge-Simple
pkgver=0.051
pkgrel=2
pkgdesc='Recursively merge two or more hashes, simply'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone')
checkdepends=('perl-test-most')
url="https://search.cpan.org/dist/$_pkgname"
source=("https://search.cpan.org/CPAN/authors/id/R/RO/ROKR/$_pkgname-$pkgver.tar.gz")
sha256sums=('1c56327873d2f04d5722777f044863d968910466997740d55a754071c6287b73')

build() {
  cd "$_pkgname-$pkgver"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="" \
      PERL_AUTOINSTALL=--skipdeps \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$_pkgname-$pkgver"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "$_pkgname-$pkgver"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
