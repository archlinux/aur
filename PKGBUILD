# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_purchase_requisition
_name=trytond_purchase_requisition
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Allows users to enter requests for product supply (requisition). This will create a Purchase request by line which will be treated by the purchasing department."
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('afd2e54bfe04b6184fb1ae94cdc729dd12a4d8cd03e96a5e67d5568c143677ed')
sha512sums=('f0c97dc5b484ddf5c51a1a12e2015995803bebe7b8909857de5b083ae4fcc7f257c5d37e6c4f9c309425d076bce566f1ce56cb56f8881a82688871912f28c4db')
b2sums=('ca74b85717edc397f8384e51f78f57dfa40d4800ece73151226a07dc628705fd2f3f9cad1bb5d64a6708003f9e115d6be70bc508a98842d3ed5c5ba798648539')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
