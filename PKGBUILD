# Maintainer: Romain Labolle <ravomavain@gmail.com>

pkgname=python-ntc-templates
_name=ntc_templates
pkgver=8.1.0
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
    python-wheel
    python-poetry
)
source=("https://github.com/networktocode/ntc-templates/releases/download/v${pkgver}/${_name}-${pkgver}.tar.gz")
sha512sums=('1b32fc87239591adaddc301d52153e298d860f57dbe8531fb07d85a2a9ed080a302b607d6fdf53e8a0fe63f5787c4b0f6a34d1ecf0f5e99d5c4ec3b841d54957')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
