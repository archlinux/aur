# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgbase=python-cryptolyzer
pkgname=('python2-cryptolyzer' 'python-cryptolyzer')
pkgver=0.3.0
pkgrel=1
pkgdesc='Fast and flexible server cryptographic (TLS/SSL) settings analyzer library for Python 2.7/3.4+ with CLI'
arch=('any')
url='https://gitlab.com/coroner/cryptolyzer'
license=('MPL2')
conflicts=('python2-cryptolyzer-git' 'python-cryptolyzer-git')
makedepends=('python-setuptools' 'python2-setuptools')
source=("cryptolyzer-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/6c/e0/9d77119b1a5bc7b494c1cee95783bc47e54a52c88c07a11750bd6acefa0a/cryptolyzer-0.3.0.tar.gz")
sha256sums=('4bd2c8aafe960e04285d1bab36873f97c42ff7c77f2aff7a1bb4965d30a7b3a9')

build_python-cryptolyzer() {
  cd "cryptolyzer-${pkgver}"
  python setup.py build
}

build_python2-cryptolyzer() {
  cd "cryptolyzer-${pkgver}"
  python2 setup.py build
}

package_python-cryptolyzer() {
  depends=('python-cryptography'
           'python-urllib3'
           'python-six'
           'python-cryptoparser')
  cd "cryptolyzer-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-cryptolyzer() {
  depends=('python2-cryptography'
           'python2-urllib3'
           'python2-six'
           'python2-cryptoparser'
           'python-enum-compat')
  cd "cryptolyzer-${pkgver}"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et: