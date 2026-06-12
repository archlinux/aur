# Maintainer: Hédy Ache <ache@ache.one>

pkgname=lolbin
pkgver=2.0.2
pkgrel=1
pkgdesc="A cli tool for managing pastes on paste.lol"
arch=('any')
url="https://git.ache.one/lolbin"
license=('MIT')
depends=('python-requests' 'python-humanize' 'python-tomli')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-hatch')
source=("${pkgname}-${pkgver}.tar.gz::https://ache.one/dist/lolbin-${pkgver}.tar.gz")
sha256sums=('0328da23e7ef3f24e85e563e06872bf2ba25e990178d5703d7f762806ffbdae1')

build() {
    cd "lolbin-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "lolbin-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
