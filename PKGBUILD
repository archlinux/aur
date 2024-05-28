# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=python-imblearn
pkgver=0.12.3
pkgrel=1
pkgdesc='A Python Package to Tackle the Curse of Imbalanced Datasets in Machine Learning'
arch=(any)
license=('MIT')
url='https://imbalanced-learn.org/'
depends=(
    'python-numpy'
    'python-scipy'
    'python-scikit-learn'
    'python-joblib'
    'python-threadpoolctl'
)
optdepends=(
    'python-pandas'
    'python-keras-applications'
    'python-tensorflow'
)
source=("https://github.com/scikit-learn-contrib/imbalanced-learn/archive/${pkgver}.tar.gz")
sha256sums=('5aa10c85a4534879684f78b758566791839706e82c8885207972bdf1942c7a06')

package() {
  cd "${srcdir}/imbalanced-learn-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -D -m644 "doc/install.rst" "${pkgdir}/usr/share/doc/${pkgname}/INSTALL.rst"
}

