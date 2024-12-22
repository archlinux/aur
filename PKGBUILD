# Maintainer: Romain Labolle <ravomavain@gmail.com>

pkgname=python-ntc-templates
_name=ntc_templates
pkgver=7.5.0
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
sha512sums=('d0a90015e1bd471c71406568962ba7dd5408a39652c5ff86ea7d2b3c0960db1c17cd46f776464a9ead2fd06c3ae7cf28994ad6217446e58a1961b865d57891cb')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
