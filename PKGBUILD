# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-glue-vispy-viewers
_pyname=glue-vispy-viewers
pkgver=0.11
pkgrel=1
pkgdesc="Linked Data Visualizations Across Multiple Files -- core library"
arch=('i386' 'x86_64')
url="http://glueviz.org/"
license=('CUSTOM')
depends=('python' 'python-numpy' 'python-opengl' 'python-qtpy' 'python-scipy' 'python-astropy' 'python-glue-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/d9/98/bbc185c3f99d8503d5dd08a3af5281b4cd029ec503d50d3e397f5b259082/${_pyname}-${pkgver}.tar.gz)
sha256sums=('252bb439a3ed733d817bdf2d5ea6456ceceb7234c17ac319846e6c09c2975ae3')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

