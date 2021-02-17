# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_customs
_name=trytond_customs
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for customs"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bbcbd365c16bc6c4cc48f0795ddbab426623b4754cdf4462f538addc01d9e464')
sha512sums=('62c0b699ca146d8bd4cb19afabe2519bc378a666c90f7f9ca18f4c54bdd7f64b279d319175253dae9583970600b68dd5566b403979b13373de058996163bcafb')
b2sums=('dd3f1c60cfa24f53c09476f5968de4911c9d705610be77f8a313b19a31283c6d5bfe624a323168ea1f5081a4e363f253b3dbedf1622c286c69754f3dbc186e16')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
