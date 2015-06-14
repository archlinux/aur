# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=perthon
pkgver=0.1
_pkgver=20031201
pkgrel=1
pkgdesc='Automatically translate Python into human-readable Perl using Perl'
arch=('any')
url='http://perthon.sourceforge.net/'
license=('GPL' 'PerlArtistic')
depends=(
perl-parse-recdescent
)
source=("http://sourceforge.net/projects/perthon/files/perthon/$pkgver/perthon-$pkgver-${_pkgver}.tar.gz")
sha256sums=('8e895fe56287b36bbccd558047119ddd929c19a96d5a30144d12a859c1b96412')
package(){
  cd "$srcdir"/$pkgname
  sed '1i#!/usr/bin/perl' -i perthon.pl
  install -Dm755 perthon.pl $pkgdir/usr/bin/perthon.pl
  install -dm755 $pkgdir/usr/share/perl5/vendor_perl/Perthon
  cp lib/Perthon/*.pm $pkgdir/usr/share/perl5/vendor_perl/Perthon
}

