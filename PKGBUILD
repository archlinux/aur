# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-glue-core
_pyname=glue-core
pkgver=1.0.1
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
source=(https://files.pythonhosted.org/packages/88/0a/361b66d591f9d68cae8810be6645e25f4a44a1f0f886eef0e543689c4718/${_pyname}-${pkgver}.tar.gz)
sha256sums=('32e7f3742bc944d0012766945eb5950ec49845c464227f34e56a380d07371fca')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 glue/icons/app_icon.png "${pkgdir}/usr/share/icons/glueviz.png"
  desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "glueviz.desktop"
}

