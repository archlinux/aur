# Maintainer: Hédy Ache <ache@ache.one>

pkgname=lolbin
pkgver=2.0.0
pkgrel=1
pkgdesc="A cli tool for managing pastes on paste.lol"
arch=('any')
url="https://git.ache.one/lolbin"
license=('MIT')
depends=('python-requests' 'python-humanize' 'python-tomli')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-hatch')
source=("${pkgname}-${pkgver}.tar.gz::https://ache.one/dist/lolbin-${pkgver}.tar.gz")
sha256sums=('1d9a5d056baf77834eecede703e69c5ca261d3b24a903aed4b83fe56e52baaa0')

build() {
    cd "lolbin-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "lolbin-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
