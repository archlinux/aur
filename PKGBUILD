# Maintainer: Hédy Ache <ache@ache.one>

pkgname=lolbin
pkgver=1.0.2
pkgrel=1
pkgdesc="A cli tool for managing pastes on paste.lol"
arch=('any')
url="https://git.ache.one/lolbin"
license=('MIT')
depends=('python-requests' 'python-humanize' 'python-tomli')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-hatch')
source=("${pkgname}-${pkgver}.tar.gz::https://ache.one/dist/lolbin-${pkgver}.tar.gz")
sha256sums=('f333c6e4792f83d9835ec34026665ca6603ef5793cd368f705219b496bde6bbd')

build() {
    cd "lolbin-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "lolbin-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
