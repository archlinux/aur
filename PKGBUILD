# Maintainer: Ben Song <bensongsyz@gmail.com>
# Contributer: Tim Liou <wheatdoge at gmail dot com>
pkgname=i3-workspace-groups
pkgver=0.4.7
pkgrel=2
pkgdesc='Tools for managing i3wm workspaces in groups.'
url='https://github.com/infokiller/i3-workspace-groups'
arch=('any')
license=('MIT')
source=("git+https://github.com/infokiller/i3-workspace-groups#tag=$pkgver")
sha256sums=('SKIP')
depends=('python' 'i3-wm' 'python-i3ipc' 'python-toml')
makedepends=(python-build python-installer python-wheel git python-setuptools python-setuptools-scm)
optdepends=('rofi: provide for a few utility scripts')
install="${pkgname}.install"

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
