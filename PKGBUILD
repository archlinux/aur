# Maintainer: Sergey Malkin <adresatt@gmail.com>

pkgname=ephyviewer
pkgver=1.0.0
pkgrel=2
pkgdesc="A Python package for handling physical quantities."
url="http://packages.python.org/quantities"
arch=("any")
license=("BSD")
depends=("python-numpy" "python-scipy" "python-matplotlib" "python-neo-git" "python-pyqtgraph")
provides=("ephyviewer")
makedepends=("python-setuptools")
source=("https://github.com/NeuralEnsemble/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("d2cb03ebdd881fd5c9ccc306ee970156")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root=${pkgdir}
}
