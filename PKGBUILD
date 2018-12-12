# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Co-Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname=('python-hkdf' 'python2-hkdf')
pkgver=0.0.3
pkgrel=3
pkgdesc="This module implements the HMAC Key Derivation function, defined at http://tools.ietf.org/html/draft-krawczyk-hkdf-01"
arch=('any')
url="https://pypi.python.org/packages/c3/be/hkdf-${pkgver}"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/c3/be/327e072850db181ce56afd51e26ec7aa5659b18466c709fa5ea2548c935f/hkdf-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py build
  python2 setup.py build
}

package_python-hkdf() {
  depends=('python')
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-hkdf() {
  depends=('python2')
  cd "${srcdir}/${pkgname#python2-}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

sha256sums=('622a31c634bc185581530a4b44ffb731ed208acf4614f9c795bdd70e77991dca')
