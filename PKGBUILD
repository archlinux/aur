# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-asysocks
_pkgname=asysocks
pkgver=0.2.5
pkgrel=2
pkgdesc="Socks5/Socks4 client and server python library"
url="https://pypi.org/project/asysocks"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('03c9ba580d528c3e5ac11747b57b1935a1b9bf34abb47d82db79730351615a5a')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
