# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pywerview
_pypiname=pywerview
pkgver=0.6
pkgrel=1
pkgdesc="A (partial) Python rewriting of PowerSploit's PowerView."
url="https://github.com/the-useless-one/pywerview"
arch=('any')
license=('GPLv3')
depends=('python' 'impacket' 'python-lxml' 'python-beautifulsoup4')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/the-useless-one/pywerview/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b40bef606a2bf2665cee1642614ca3a5f8e5029e499e34ed726474b45e3e4d4d')

build() {
    cd "${_pypiname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pypiname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
