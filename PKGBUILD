# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

pkgname=python-ebaysdk
_pkgname=ebaysdk-python
pkgver=2.1.4
pkgrel=2
pkgdesc="eBay SDK for Python"
url=https://github.com/timotheus/ebaysdk-python
arch=('any')
license=('CDDL')
depends=('python' 'python-lxml' 'python-requests')
makedepends=('python-setuptools')

source=("https://github.com/timotheus/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('3fc960806861d9d83269c1b820f38f3c')

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}"
  rm -r "${pkgdir}"/usr/lib/python3.6/site-packages/{samples,tests}
}
