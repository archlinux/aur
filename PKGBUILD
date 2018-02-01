# Maintainer: Sergey Malkin <adresatt@gmail.com>
pkgname=python-neo
pkgver=0.5.2
pkgrel=1
pkgdesc="Neo is a Python package for working with electrophysiology data in Python"
arch=("i686" "x86_64")
url="http://neuralensemble.org/neo"
license=("custom")
depends=("python" "python-numpy" "python-quantities")
makedepends=('python-setuptools')
source=("https://github.com/NeuralEnsemble/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("ba857329e6d4859cd9ea8eb8f63c8ade")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --prefix=/usr --root=${pkgdir}
}
