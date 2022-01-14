# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=oscclip
pkgver=0.3.0
pkgrel=1
pkgdesc='Utilities for managing the clipboard using OSC52'
arch=(any)
url="https://codeberg.org/rumpelsepp/oscclip"
license=("GPLv3")
depends=("python")
makedepends=("python-setuptools" "python-dephell")
optdepends=()
source=("https://codeberg.org/rumpelsepp/oscclip/archive/v${pkgver}.tar.gz")
sha256sums=('8e0ffd46e8cb9f6d3efcfca5dd643237a393a9287d03dc928f13b0248b7e7822')

prepare() {
    cd "$pkgname"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
    cd "$pkgname"
	python setup.py build
}

package() {
    cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
