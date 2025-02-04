# Maintainer: Sigurd Hellesvik <sigurd@hellesvik.eu>

_pkgname=svada
pkgname=python-${_pkgname}
pkgver=2.2.0
pkgrel=1
pkgdesc='General-purpose parser for quickly and efficiently parsing CMSIS SVD files into concise objects for use in various applications.'
arch=(any)
url="https://pypi.org/project/${_pkgname}/"
license=(Apache-2.0)
depends=('python' 'python-click' 'python-lxml' 'python-numpy' 'python-typing_extensions' 'python-packaging' 'python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('178e909e8317d0caabac169086429abf35eaeb66425e4bf791b403d0dbfe5a67')

build() {
	cd "${_pkgname}-${pkgver}"
  python -m build --wheel
}

package() {
	cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
