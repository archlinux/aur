# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-gfycat-git
pkgver=r35.45c9fd4
pkgrel=1
pkgdesc='A Python client for the Gfycat API'
arch=('any')
url="https://github.com/ankeshanand/py-gfycat"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
source=("${pkgname%-git}::git+https://github.com/ankeshanand/py-gfycat")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${pkgname%-git}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}