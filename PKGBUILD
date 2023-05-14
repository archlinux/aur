# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pywerview
_pypiname=pywerview
pkgver=0.4.1
pkgrel=1
pkgdesc="A (partial) Python rewriting of PowerSploit's PowerView."
url="https://github.com/the-useless-one/pywerview"
arch=('any')
license=('GPLv3')
depends=('python' 'impacket' 'python-lxml' 'python-beautifulsoup4')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/the-useless-one/pywerview/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ae4a21607ea7b068c4799095f114ee4693ce6033cfeb38ea70c8be8e26c08bbe')

build() {
    cd "${_pypiname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pypiname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
