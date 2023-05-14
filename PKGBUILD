# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-json2html
_pkgname=json2html
pkgver=1.3.0
pkgrel=2
pkgdesc="Python wrapper to convert JSON into a human readable HTML Table representation."
url="https://pypi.org/project/json2html/"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8951a53662ae9cfd812685facdba693fc950ffc1c1fd1a8a2d3cf4c34600689c')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
