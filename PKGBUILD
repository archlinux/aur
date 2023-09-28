# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pywerview
_pypiname=pywerview
pkgver=0.5.1
pkgrel=1
pkgdesc="A (partial) Python rewriting of PowerSploit's PowerView."
url="https://github.com/the-useless-one/pywerview"
arch=('any')
license=('GPLv3')
depends=('python' 'impacket' 'python-lxml' 'python-beautifulsoup4')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/the-useless-one/pywerview/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('68626566b17aabd523af3fc7c992181552280ba347383f6d2ab4ca007912a544')

build() {
    cd "${_pypiname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pypiname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
