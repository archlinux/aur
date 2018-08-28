# Maintainer: dude <brrtsm@gmail.com>
pkgname=python2-vulndb
pkgver=0.1.0
pkgrel=1
pkgdesc="Vulnerability Database"
url='https://github.com/vulndb/python-sdk/'
arch=('any')
license=('custom:BSD-3-Clause')
depends=('python2')
makedepends=('python2-setuptools')

source=(${pkgver}.tar.gz::https://files.pythonhosted.org/packages/b6/8e/e5dc89c7d916615f44d8854d471e93965ab25282df2818d239ff8e759fed/vulndb-${pkgver}.tar.gz)
sha256sums=('8f1f5e806adeaaea3c97094bcea8b21ac90b40d5432d0dc9760796e624decf78')

package() {
  cd "vulndb-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
