# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_party_siret
_name=trytond_party_siret
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to add SIRET/SIREN on parties"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0aba80dc94d3d734ab0ba66ef5db280ac6fca623590651cfbaf5bed49dbaa2f1')
b2sums=('48b7565f1ba0de707602b6768304ef875cb3a70c16e0bf3417819ff4545a6404952e933ef303514ee7cf47ac6230c19c899d9736fccce30aac13041850fa0843')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
