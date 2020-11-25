# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=cppyy-backend
pkgver=1.14.1
pkgrel=1
pkgdesc="Cling-based Python-C++ bindings (backend)"
arch=('any')
url="https://cppyy.readthedocs.io/en/latest/index.html"
license=('LBNL BSD')
depends=('python' 'cppyy-cling' 'python-wheel')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/c2/f6/09379f9d973e5acc92f1aa8cc35cbc59adbdf0983bae14352531d995b2f5/${pkgname}-${pkgver}.tar.gz")
sha256sums=('be69fc0afd48a25a0359627857926aa7d39b8ee731b14cab0d8990b0a60825f0')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

