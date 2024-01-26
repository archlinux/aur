# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=python-imblearn
pkgver=0.12.0
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
sha256sums=('7b198c2606c9ab3eb8231ac14e4ce858bf4ffc0b465bf3f7fabba606de7f89e9')

package() {
  cd "${srcdir}/imbalanced-learn-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -D -m644 "doc/install.rst" "${pkgdir}/usr/share/doc/${pkgname}/INSTALL.rst"
}

