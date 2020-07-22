# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('python2-cryptolyzer' 'python-cryptolyzer')
pkgver=0.2.0
pkgrel=1
pkgdesc='Fast and flexible server cryptographic (TLS/SSL) settings analyzer library for Python 2.7/3.4+ with CLI'
arch=('any')
url='https://gitlab.com/coroner/cryptolyzer'
license=('MPL2')
conflicts=('python2-cryptolyzer-git' 'python-cryptolyzer-git')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/coroner/cryptolyzer/-/archive/v${pkgver}/cryptolyzer-v${pkgver}.tar.gz")
sha256sums=('da995c7b7b90c772888872ac74e6c29efeb897e7e25901eff59ceb85175063ff')

build_python-cryptolyzer() {
  cd "cryptolyzer-v${pkgver}"
  python setup.py build
}

build_python2-cryptolyzer() {
  cd "cryptolyzer-v${pkgver}"
  python2 setup.py build
}

package_python-cryptolyzer() {
  depends=('python-cryptography'
           'python-urllib3'
           'python-six'
           'python-cryptoparser')
  cd "cryptolyzer-v${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-cryptolyzer() {
  depends=('python2-cryptography'
           'python2-urllib3'
           'python2-six'
           'python2-cryptoparser'
           'python-enum-compat')
  cd "cryptolyzer-v${pkgver}"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et: