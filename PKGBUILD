pkgname=python-orange
pkgver=3.19.0
pkgrel=1
pkgdesc="Open source data visualization and analysis for novice and experts. Data mining through visual programming or Python scripting."
arch=('i686' 'x86_64')
url="http://orange.biolab.si/"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-beautifulsoup4' 'python-chardet' 'python-docutils' 'python-pyqtgraph' 'python-xlrd' 'python-matplotlib' 'python-scikit-learn' 'python-recommonmark' 'python-sqlparse' 'python-psycopg2' 'python-joblib' 'python-keyrings-alt' 'python-bottleneck' 'python-anyqt' 'python-dill' 'python-pip' 'python-serverfiles' 'python-louvain' 'python-xlsxwriter' 'python-fasttsne')
source=("https://github.com/biolab/orange3/archive/${pkgver}.tar.gz")
sha256sums=('9ae6e72fa2ffebe3945d1813439e809fd353ef386fb8cfa10c3cfe3917e03042')

build() {
  cd "${srcdir}/orange3-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/orange3-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 distribute/orange-canvas.desktop "${pkgdir}"/usr/share/applications/orange-canvas.desktop
  install -Dm644 distribute/icon-256.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/orange-canvas.png
}

