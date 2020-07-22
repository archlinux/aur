# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-cryptoparser-git
pkgver=r78.85ff825
pkgrel=1
pkgdesc='A cryptographic protocol parser'
arch=('any')
url='https://gitlab.com/coroner/cryptoparser'
license=('MPL2')
provides=('python-cryptoparser')
conflicts=('python-cryptoparser')
depends=('python-attrs'
         'python-six')
makedepends=('python-setuptools')
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short   HEAD)"
}

build() {
  cd "${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et: