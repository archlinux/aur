# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=python-imblearn
pkgver=0.8.0
pkgrel=1
pkgdesc='A Python Package to Tackle the Curse of Imbalanced Datasets in Machine Learning'
arch=(any)
license=('MIT')
url='https://imbalanced-learn.org/'
depends=(
    'python-numpy'
    'python-scipy'
    'python-scikit-learn'
)
makedepends=(
    'git'
)
optdepends=(
    'python-keras-applications'
    'python-tensorflow'
)
source=("https://github.com/scikit-learn-contrib/imbalanced-learn/archive/${pkgver}.tar.gz")
sha256sums=('b1dd27dba7b8593b89d32bc7d80efdcd99aa37da9f62a8ecb99ff6589a949db3')

package() {
  cd "${srcdir}/imbalanced-learn-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -D -m644 "doc/install.rst" "${pkgdir}/usr/share/doc/${pkgname}/INSTALL.rst"
}

