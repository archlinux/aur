# Maintainer: Romain Labolle <ravomavain@gmail.com>

pkgname=python-ntc-templates
_name=ntc_templates
pkgver=9.3.0
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
sha512sums=('6678c79d4ddb368d865d7a48d6fbb15fa7036990f36721d3b97e6fc9c0387ef0da1abc04de407c225cf8c10a89c66d21d728fb496fb8d5852749fa4a19e0e4bf')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
