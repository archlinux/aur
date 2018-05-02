# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-glue-vispy-viewers
_pyname=glue-vispy-viewers
pkgver=0.10
pkgrel=1
pkgdesc="Linked Data Visualizations Across Multiple Files -- core library"
arch=('i386' 'x86_64')
url="http://glueviz.org/"
license=('CUSTOM')
depends=('python' 'python-numpy' 'python-opengl' 'python-qtpy' 'python-scipy' 'python-astropy' 'python-glue-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/9d/45/2d5a90071d68e6f454a72ae2e008e6aa174279d306f496ded1cf4103b050/${_pyname}-${pkgver}.tar.gz)
sha256sums=('e76e8b470f3f7efaac9754e637b367f128f181b368931cc8c77002109c272a4a')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

