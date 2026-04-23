# Maintainer: Ben Song <bensongsyz@gmail.com>
# Contributer: Tim Liou <wheatdoge at gmail dot com>
_pkgname=i3-workspace-groups
pkgname="$_pkgname"-enhanced
pkgver=0.4.7.1
pkgrel=1
pkgdesc='Tools for managing i3wm workspaces in groups(with icon in sway supported).'
url='https://github.com/BenSYZ/i3-workspace-groups'
arch=('any')
license=('MIT')
source=("git+https://github.com/BenSYZ/i3-workspace-groups#tag=$pkgver")
sha256sums=('SKIP')
depends=('python' 'python-i3ipc' 'python-toml')
makedepends=(python-build python-installer python-wheel python-setuptools python-setuptools-scm)
provides=(i3-workspace-groups)
conflicts=(i3-workspace-groups)
optdepends=(
    'rofi: provide for a few utility scripts'
    'i3-wm'
    'sway'
    )

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
