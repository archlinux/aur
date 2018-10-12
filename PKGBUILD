# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-glue-core
_pyname=glue-core
pkgver=0.13.3
pkgrel=1
pkgdesc="Linked Data Visualizations Across Multiple Files -- core library"
arch=('i386' 'x86_64')
url="http://glueviz.org/"
license=('CUSTOM')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-pandas' 'python-astropy' 'python-pyqt5' 'ipython' 'python-ipykernel' 'python-qtconsole' 'python-dill' 'python-h5py' 'python-mpl-scatter-density')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/80/72/0aa7bb8a99323b5ee0d67c359066188c0e9de1d8f3575b39a3fe5515be50/${_pyname}-${pkgver}.tar.gz)
sha256sums=('da4e3e9c18366c81effb37cbe281fdaa4899e8acb01c47ac0f0f4d5d156677e9')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

