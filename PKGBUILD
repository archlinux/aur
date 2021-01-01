# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=glueviz
pkgver=1.0.0
pkgrel=1
pkgdesc="Linked Data Visualizations Across Multiple Files"
arch=('i386' 'x86_64')
url="http://glueviz.org/"
license=('CUSTOM')
depends=('python' 'python-glue-core' 'python-glue-vispy-viewers' 'python-numpy' 'python-matplotlib' 'python-scipy'
         'python-pandas' 'python-astropy' 'python-pyqt3d' 'python-pyqt5' 'python-pyqtchart' 'python-pyqtdatavisualization' 'python-pyqtpurchasing' 'python-pyqtwebengine' 'ipython' 'python-ipykernel' 'python-qtconsole' 'python-dill'
         'python-h5py' 'python-xlrd' 'python-mpl-scatter-density' 'python-bottleneck')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/08/69/38d188e12ea19241355be1a212702775d0e48463d765b98d366dc6aaa63b/${pkgname}-${pkgver}.tar.gz)
sha256sums=('89db2b2331eb74f221251b129f6ce6b507f14101caea993ee0926ceeeaaf68ab')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

