# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=glueviz
pkgver=0.13.2
pkgrel=1
pkgdesc="Linked Data Visualizations Across Multiple Files"
arch=('i386' 'x86_64')
url="http://glueviz.org/"
license=('CUSTOM')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-pandas' 'python-astropy' 'python-pyqt5' 'ipython' 'python-ipykernel' 'python-qtconsole' 'python-dill' 'python-h5py')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/a2/71/f6741c6bc70ff6a2e22a2ab3312940f4a17efcc063c03197c74212596a07/${pkgname}-${pkgver}.tar.gz)
sha256sums=('0a2b3a827eecd1b013427be925de4e5b15fed0fe26bf55457273f825e6b298b6')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

