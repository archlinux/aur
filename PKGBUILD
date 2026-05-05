# Maintainer: PenguinBurner contributors

pkgname=penguin-burner
pkgver=0.1.5
pkgrel=1
pkgdesc='NVIDIA GPU automatic undervolting and fine tuning tool'
arch=('x86_64')
url='https://github.com/jpietek/PenguinBurner'
license=('GPL-3.0-or-later')
depends=(
  'bash'
  'hicolor-icon-theme'
  'nvidia-utils>=580'
  'pyside6>=6.7'
  'python'
  'python-pyqtgraph>=0.13'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jpietek/PenguinBurner/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7c2405564ba9e0f44ed90b9db2c3ae793556d3ed3002ed7c507d76af702ac768')

build() {
  cd "PenguinBurner-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "PenguinBurner-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
