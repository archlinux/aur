# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-glue-core
_pyname=glue-core
pkgver=0.14.1
pkgrel=2
pkgdesc="Linked Data Visualizations Across Multiple Files -- core library"
arch=('i386' 'x86_64')
url="http://glueviz.org/"
license=('CUSTOM')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-pandas' 'python-astropy' 'python-pyqt5' 'ipython' 'python-ipykernel' 'python-qtconsole' 'python-dill' 'python-h5py' 'python-mpl-scatter-density')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/b6/52/94338f1b3c04baf4e865f7621b5372553eec7ad246dc48939e62bc3957f1/${_pyname}-${pkgver}.tar.gz)
sha256sums=('a5c174ffbaec3fbbd299d69791f3330e173c071050135ff2ec584da90d274c12')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 glue/icons/app_icon.png "${pkgdir}/usr/share/icons/glueviz.png"
  desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "glueviz.desktop"
}

