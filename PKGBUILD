# Maintainer: Thomas Haider <t.haider@deprecate.de>
pkgname=python2-publicsuffix
pkgver=1.1.0
pkgrel=1
pkgdesc="Get a public suffix for a domain name using the Public Suffix List."
arch=('any')
url="https://pypi.python.org/pypi/publicsuffix"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/p/publicsuffix/publicsuffix-${pkgver}.tar.gz")
sha256sums=('ae77593d269e1e5131723259cc1142c25690c20c59f2e98f67e227228028bda9')

build() {
  cd ${pkgname/python2-}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${pkgname/python2-}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
