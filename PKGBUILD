# Maintainer: Hédy Ache <ache@ache.one>

pkgname=lolbin
pkgver=1.0.1
pkgrel=2
pkgdesc="A cli tool for managing pastes on paste.lol"
arch=('any')
url="https://git.ache.one/lolbin"
license=('MIT')
depends=('python-requests' 'python-humanize' 'python-tomli')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://ache.one/dist/lolbin-${pkgver}.tar.gz")
sha256sums=('8d327f3488641bc88452107201618b4364003e808d5703b08d0d6df903b8033e')

build() {
    cd "lolbin-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "lolbin-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
