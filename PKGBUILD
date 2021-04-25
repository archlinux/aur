pkgname=python-orange
pkgver=3.27.1
pkgrel=1
pkgdesc="Open source data visualization and analysis for novice and experts. Data mining through visual programming or Python scripting."
arch=('x86_64')
url="http://orange.biolab.si/"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-chardet' 'python-docutils' 'python-pyqtgraph' 'python-xlrd' 'python-matplotlib' 'python-scikit-learn' 'python-psycopg2' 'python-joblib' 'python-keyrings-alt' 'python-bottleneck' 'python-anyqt' 'qt5-svg' 'python-pip' 'python-serverfiles' 'python-louvain' 'python-xlsxwriter' 'python-opentsne' 'python-networkx' 'python-requests' 'python-pandas' 'python-openpyxl' 'python-orange-widget-base' 'python-orange-canvas-core' 'python-baycomp' 'python-httpx')
source=("https://github.com/biolab/orange3/archive/${pkgver}.tar.gz")
sha256sums=('0814bd19e622816eb37a54ed807c0820c7e6fe543697a2a8a9a5caafe4915db7')

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

