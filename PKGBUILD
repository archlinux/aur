# Maintainer: Yigit Sever <yigit at yigitsever dot com>
pkgname=python-html-text
_pkgname=html-text
pkgver=0.7.0
pkgrel=1
pkgdesc="Python library to extract text from HTML"
arch=('any')
url="https://github.com/zytedata/html-text"
license=('MIT')
depends=(python-lxml)
makedepends=(python-build python-installer python-wheel)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('9a48cd367c3720731dbb4c67700a80a14a313c1359c63dad660e3961681bb0c0')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
