# $Id: PKGBUILD 126373 2015-01-21 20:31:43Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

_dbname=odlyzko_zeta
pkgname=sage-data-$_dbname
pkgver=20061209
pkgrel=1
pkgdesc="Table of zeros of the Riemann zeta function for Sage"
arch=(any)
url="http://www.sagemath.org"
license=(GPL)
depends=()
makedepends=(sage-mathematics)
source=("http://www.sagemath.org/packages/upstream/database_$_dbname/database_$_dbname-$pkgver.tar.bz2" 'spkg-install')
md5sums=('c93f63760540d5a787728a7a89ca2d9c'
         'c1c5c4b15ea6a727aeeed9e389ae3311')

package() {
  export PYTHONPATH="$PWD:/usr/lib/sage/site-packages:/usr/bin"
  export SAGE_LOCAL="/usr"
  export SAGE_SHARE="$pkgdir/usr/share/sage"

  ln -s database_$_dbname-$pkgver src
  python2 spkg-install
}
