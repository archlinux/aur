# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Contributor: Charles Pigott <charlespigott@googlemail.com>

_perlmod=parse-debcontrol
_modnamespace=parse
pkgname=perl-$_perlmod
_perlname=Parse-DebControl
pkgver=2.005
pkgrel=3
pkgdesc="Easy OO parsing of debian control-like files"
arch=('any')
url="https://metacpan.org/module/Parse::DebControl"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-io-stringy')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/J/JA/JAYBONCI/$_perlname-$pkgver.tar.gz")
sha256sums=('b64bce1ff212d7e3ef9d4368e7b62749cf27751fa8360cdf53e969123346a729')

build() {
  cd "$srcdir/$_perlname-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_perlname-$pkgver"
  make install DESTDIR="$pkgdir/"
}
