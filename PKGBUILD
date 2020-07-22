# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgbase=python-cryptoparser-git
pkgname=('python-cryptoparser-git' 'python2-cryptoparser-git')
pkgver=r78.85ff825
pkgrel=1
pkgdesc='A cryptographic protocol parser'
arch=('any')
url='https://gitlab.com/coroner/cryptoparser'
license=('MPL2')
provides=('python-cryptoparser' 'python2-cryptoparser')
conflicts=('python-cryptoparser' 'python2-cryptoparser')
makedepends=('python-setuptools')
source=("python-cryptoparser::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd python-cryptoparser
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short   HEAD)"
}

build_python2-cryptoparser-git() {
  cd python-cryptoparser
  python2 setup.py build
}

build_python-cryptoparser-git() {
  cd python-cryptoparser
  python setup.py build
}

package_python2-cryptoparser-git() {
  depends=('python2-attrs'
           'python2-six')
  cd python-cryptoparser
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-cryptoparser-git() {
  depends=('python-attrs'
           'python-six')
  cd python-cryptoparser
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et: