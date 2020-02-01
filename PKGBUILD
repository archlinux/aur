# $Id: PKGBUILD 126373 2015-01-21 20:31:43Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

_dbname=odlyzko_zeta
pkgname=sage-data-$_dbname
pkgver=20061209
pkgrel=3
pkgdesc="Table of zeros of the Riemann zeta function for SageMath"
arch=(any)
url="http://www.sagemath.org"
license=(GPL)
depends=()
makedepends=(sagemath)
#source=("http://www.sagemath.org/packages/upstream/database_$_dbname/database_$_dbname-$pkgver.tar.bz2" 
source=("http://mirrors.mit.edu/sage/spkg/upstream/database_odlyzko_zeta/database_$_dbname-$pkgver.tar.bz2"
	'spkg-install')
sha256sums=('8919f01992718b9bf5c0602dbf16dd9d6f58b141b25f67f5cfd59f6cd0f9a0d4'
            'dc9046854aaed9458d370bd675821ea9871e6b55f5542470be3d1b4c763f3c53')

package() {
  export PYTHONPATH="$PWD:/usr/lib/sage/site-packages:/usr/bin"
  export SAGE_LOCAL="/usr"
  export SAGE_SHARE="$pkgdir/usr/share"

  ln -s database_$_dbname-$pkgver src
  python spkg-install
}
