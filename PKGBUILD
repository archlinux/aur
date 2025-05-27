# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pywerview
_pypiname=pywerview
pkgver=0.7.3
pkgrel=1
pkgdesc="A (partial) Python rewriting of PowerSploit's PowerView."
url="https://github.com/the-useless-one/pywerview"
arch=('any')
license=('GPLv3')
depends=('python' 'impacket' 'python-lxml' 'python-beautifulsoup4')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/the-useless-one/pywerview/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1f148c9d238861184de1bec522a58f5bf8194c4c6fea97eef00690ae9f553adf')

build() {
    cd "${_pypiname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pypiname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
