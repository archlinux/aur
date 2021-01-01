# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-glue-vispy-viewers
_pyname=glue-vispy-viewers
pkgver=1.0.2
pkgrel=1
pkgdesc="Linked Data Visualizations Across Multiple Files -- core library"
arch=('i386' 'x86_64')
url="http://glueviz.org/"
license=('CUSTOM')
depends=('python' 'python-numpy' 'python-opengl' 'python-qtpy' 'python-scipy' 'python-astropy' 'python-glue-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/ac/62/8ca0d4693f94bff1764185d876ed0b896fbe79bbd4c3fcb1c69683b52a4d/${_pyname}-${pkgver}.tar.gz)
sha256sums=('6e0fc7f0e0c1d62756953582830357dcccf8bc8f61ea0fb7613c08df91f59671')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

