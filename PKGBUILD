# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_product
_name=trytond_product
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module with products"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('824532bcc6945475fb1417300c367b654b02af44e9af131e97bc652fefb32874')
sha512sums=('a0e4a2fffade209ff61e6791258c8f9bf079d108211820eda9c58f6f7f34733f2f6d54681662e6ddbb10b15634db81ed96c0266d9793e55d87520fd3a20c39f6')
b2sums=('77b3d709cf6e7c392cd684e4f530fcaad6e615cb52b16699a5e024617a6af76a91ee7db12968292dc98bef6447c810d4ab332936b6d6c3fa792978cabf584789')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
