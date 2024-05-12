# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=python-bloodhound
_pkgname=bloodhound
pkgver=1.7.2
pkgrel=1
pkgdesc="Python based ingestor for BloodHound, based on Impacket"
arch=('any')
url="https://github.com/fox-it/BloodHound.py"
license=('MIT')
groups=()
depends=('python' 'impacket' 'python-ldap3' 'python-dnspython' 'python-future' 'python-pyasn1')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('512654d7d74ba69a2ad7df89305b62a23c8993a6e3f7a9cfd89403abb2459073')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
