# Maintainer: Hédy Ache <ache@ache.one>

pkgname=lolbin
pkgver=1.0.0
pkgrel=1
pkgdesc="A cli tool for managing pastes on paste.lol"
arch=('any')
url="https://git.ache.one/lolbin"
license=('MIT')
depends=('python-requests' 'python-humanize' 'python-tomli')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://ache.one/dist/lolbin-${pkgver}.tar.gz")
sha256sums=('1c213f6bc9027c8438651bb1787c1c0e4f36bdb72f60e0812b03ae24a6c657d3')

build() {
    cd "lolbin-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "lolbin-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
