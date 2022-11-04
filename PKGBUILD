# Maintainer: Zacharias Knudsen <zachasme@gmail.com>

pkgname=pgxnclient
pkgver=1.3.2
pkgrel=1
pkgdesc="Command line tool to interact with the PostgreSQL Extension Network"
arch=('x86_64')
url="http://pgxn.org/"
license=('BSD')
depends=('python')
makedepends=('python-distribute')
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('6f47dc54363ee30d6e5f0af19ca5ef26')

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
