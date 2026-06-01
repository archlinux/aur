# Maintainer: PenguinBurner contributors

pkgname=penguin-burner
pkgver=0.2.5
pkgrel=1
pkgdesc='NVIDIA GPU automatic undervolting and fine tuning tool'
arch=('x86_64')
url='https://github.com/jpietek/PenguinBurner'
license=('GPL-3.0-or-later')
depends=(
  'bash'
  'hicolor-icon-theme'
  'pyside6>=6.7'
  'python'
  'python-colorama>=0.4'
  'python-pyqtgraph>=0.13'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jpietek/PenguinBurner/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "PenguinBurner-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "PenguinBurner-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
