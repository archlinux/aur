# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-glue-core
_pyname=glue-core
pkgver=1.12.0
pkgrel=1
pkgdesc="Linked Data Visualizations Across Multiple Files -- core library"
arch=('i386' 'x86_64')
url="http://glueviz.org/"
license=('CUSTOM')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-pandas' 'python-astropy' 
         'python-qtpy' 'ipython' 'python-ipykernel' 'python-qtconsole' 
         'python-dill' 'python-xlrd' 'python-h5py' 'python-bottleneck' 
         'python-mpl-scatter-density')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/f2/56/98c10dcce197d099290c618f41509d8032552ecbc971f8c2052f62c4f87a/${_pyname}-${pkgver}.tar.gz)
sha256sums=('f0a40f7d80a971b42fa7051d9e4c43a3accdd3e328aadc093bb45b038fbcc068')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 glue/icons/app_icon.png "${pkgdir}/usr/share/icons/glueviz.png"
  desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "glueviz.desktop"
}

