# Maintainer: Zacharias Knudsen <zachasme@gmail.com>

pkgname=pgxnclient
pkgver=1.3
pkgrel=1
pkgdesc="Command line tool to interact with the PostgreSQL Extension Network"
arch=('x86_64')
url="http://pgxn.org/"
license=('BSD')
depends=('python')
makedepends=('python-distribute')
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('f632501b250bb52dba37a3b54f6ab0c6')

build() {
  cd $srcdir/$pkgname-$pkgver

  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver


  install -d -m755 "${pkgdir}/usr/share/licenses/$pkgname"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/"
  
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
