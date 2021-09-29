# Maintainer: Yigit Sever <yigit at yigitsever dot com>
pkgname=python-html-text
_pkgname=html-text
pkgver=0.5.2
pkgrel=1
pkgdesc="Python library to extract text from HTML"
arch=('any')
url="https://github.com/TeamHG-Memex/html-text"
license=('MIT')
depends=('python-lxml')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c75a1da10d649f55162446de57f98374059a998071110a343815841286a442f9')

build() {
  cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1
}
