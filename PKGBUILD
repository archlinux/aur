
# Maintainer: rpizerow2-rgb <rpizerow2@gmail.com>
pkgname=pmgui
pkgver=1.1.1
pkgrel=1
pkgdesc="A lightweight, zero-confirmation GUI for Arch Linux package management and AUR"
arch=("any")
url="https://github.com/rpizerow2-rgb/pmgui"
license=("MIT")
depends=("python" "python-pyqt6" "yay" "polkit")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rpizerow2-rgb/pmgui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d83844ababd12227184ec181fa15d6b099c02177a85ba8966e8f0b7aa93ab6db')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
