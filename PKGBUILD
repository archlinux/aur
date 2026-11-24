# Maintainer: Romain Labolle <ravomavain@gmail.com>

pkgname=python-ntc-templates
_name=ntc_templates
pkgver=9.4.0
pkgrel=1
pkgdesc="TextFSM templates for parsing show commands of network devices"
url="https://github.com/networktocode/ntc-templates"
license=('Apache-2.0')
arch=('any')
depends=(
    python-textfsm
)
makedepends=(
    python-build
    python-installer
    python-poetry-core
)
source=("https://github.com/networktocode/ntc-templates/releases/download/v${pkgver}/${_name}-${pkgver}.tar.gz")
sha512sums=('220147be1bf467c23e5516607689106387a48b21368cb6711e4289243a9dc1d29e745b4539ea51c051447a43ffa60462876035bfd34fd263b6f36db0a23038f2')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
