# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-py-stackexchange-git
pkgver=1.247.18243b1
pkgrel=1
pkgdesc="A Python binding for the StackExchange API"
arch=('any')
url="https://github.com/lucjon/Py-StackExchange"
license=('BSD-3-Clause')
makedepends=("python-setuptools" 'python-six')
provides=('python-py-stackexchange' 'python-stackexchange')
conflicts=("python-py-stackexchange" "${pkgname}")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/Py-StackExchange"
  printf "1.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {
    cd "${srcdir}/Py-StackExchange"
    python setup.py install --root="$pkgdir/" --optimize=1
}