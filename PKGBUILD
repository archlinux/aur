# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>

_pkgname=Template-Plugin-JavaScript
pkgname=perl-template-plugin-javascript
pkgver=0.02
pkgrel=1
pkgdesc="Encodes text to be safe in JavaScript"
arch=("any")
license=("PerlArtistic" "GPL")
options=("!emptydirs")
depends=('perl')
url="http://search.cpan.org/~miyagawa/Template-Plugin-JavaScript"
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/$_pkgname-$pkgver.tar.gz")
md5sums=('1e640dc8829a6026bf674b166855b189')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
