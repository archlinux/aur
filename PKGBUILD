# Maintainer: Sigurd Hellesvik <sigurd@hellesvik.eu>

_pkgname=svada
pkgname=python-${_pkgname}
pkgver=2.2.1
pkgrel=1
pkgdesc='General-purpose parser for quickly and efficiently parsing CMSIS SVD files into concise objects for use in various applications.'
arch=(any)
url="https://pypi.org/project/${_pkgname}/"
license=(Apache-2.0)
depends=('python' 'python-click' 'python-lxml' 'python-numpy' 'python-typing_extensions' 'python-packaging' 'python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('888d69dbefaa21dc73b5be49bee820b7a9c05273f0818938fbbcd802e0f49c4e')

build() {
	cd "${_pkgname}-${pkgver}"
  python -m build --wheel
}

package() {
	cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
