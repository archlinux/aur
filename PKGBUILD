# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

pkgname=python-ebaysdk
_pkgname=ebaysdk-python
pkgver=2.2.0
pkgrel=1
pkgdesc="eBay SDK for Python"
url=https://github.com/timotheus/ebaysdk-python
arch=('any')
license=('CDDL')
depends=('python' 'python-lxml' 'python-requests')
makedepends=('python-setuptools')

source=("https://github.com/timotheus/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('ef9fa8544661ba11593680fe1ba595a6')

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}"
  rm -r "${pkgdir}"/usr/lib/python*/site-packages/{samples,tests}
}
