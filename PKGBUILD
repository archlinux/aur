# Maintainer: Yigit Sever <yigit at yigitsever dot com>
pkgname=python-html-text
_pkgname=html-text
pkgver=0.7.1
pkgrel=1
pkgdesc="Python library to extract text from HTML"
arch=('any')
url="https://github.com/zytedata/html-text"
license=('MIT')
depends=(python-lxml)
makedepends=(python-build python-installer python-wheel python-hatchling)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('10c841f375e5e31ef25d484c6e4bef931be2e58c2fb23cc0aec395999ab81865')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
