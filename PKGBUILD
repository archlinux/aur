# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=glueviz
_pkgname=glue
pkgver=1.12.0
pkgrel=1
pkgdesc="Linked Data Visualizations Across Multiple Files"
arch=('i386' 'x86_64')
url="http://glueviz.org/"
license=('CUSTOM')
depends=('python' 'python-glue-core' 'python-glue-vispy-viewers' 'python-numpy' 'python-matplotlib' 'python-scipy'
         'python-pandas' 'python-astropy' 'python-pyqt3d' 'python-pyqt5' 'python-pyqtchart' 'python-pyqtdatavisualization' 'python-pyqtpurchasing' 'python-pyqtwebengine' 'ipython' 'python-ipykernel' 'python-qtconsole' 'python-dill'
         'python-h5py' 'python-xlrd' 'python-mpl-scatter-density' 'python-bottleneck')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/glue-viz/glue/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e06329f7066370b1cdfca24dce4268ef602b81e8ba15ae374760c26f57f98ac4')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

