# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-glue-core
_pyname=glue-core
pkgver=0.13.2
pkgrel=1
pkgdesc="Linked Data Visualizations Across Multiple Files -- core library"
arch=('i386' 'x86_64')
url="http://glueviz.org/"
license=('CUSTOM')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-pandas' 'python-astropy' 'python-pyqt5' 'ipython' 'python-ipykernel' 'python-qtconsole' 'python-dill' 'python-h5py')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/c1/5b/abcfa7d826d58c1016d51306b11cb994b20dd11ecb1a35f6c80f095758c7/${_pyname}-${pkgver}.tar.gz)
sha256sums=('9a52bdbfac355579caed2735ba7644113d861ce2c4e084830c99a69374043495')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

