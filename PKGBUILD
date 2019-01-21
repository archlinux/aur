# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=glueviz
pkgver=0.14.0
pkgrel=1
pkgdesc="Linked Data Visualizations Across Multiple Files"
arch=('i386' 'x86_64')
url="http://glueviz.org/"
license=('CUSTOM')
depends=('python' 'python-glue-core' 'python-glue-vispy-viewers')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/d0/2f/4da66f6905fec451dd210cf5158db894feb02202828d12d896e112dd75d0/${pkgname}-${pkgver}.tar.gz)
sha256sums=('8b084f94e429048074f8f2e26243c104a2ce64e2d501529e431a09fdedf66e83')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

