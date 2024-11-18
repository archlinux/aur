# Maintainer: Yigit Sever <yigit at yigitsever dot com>
pkgname=python-html-text
_pkgname=html-text
pkgver=0.6.2
pkgrel=1
pkgdesc="Python library to extract text from HTML"
arch=('any')
url="https://github.com/zytedata/html-text"
license=('MIT')
depends=(python-lxml)
makedepends=(python-build python-installer python-wheel)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('2bda73192e3009bacb626c8feacc9ab5f0685947eb5847e181fb1d330410bcc3')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
