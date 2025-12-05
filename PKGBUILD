# Maintainer: envolution
# Contributor: Danny Waser (Waser Technologies) <waser@waser.tech>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-coqui-trainer
_pkgname=coqui-ai-Trainer
pkgver=0.3.2
pkgrel=1
pkgdesc='General purpose model trainer for PyTorch - idiap fork'
arch=(any)
url="https://github.com/idiap/coqui-ai-Trainer"
license=(Apache-2.0)
depends=(python python-coqpit python-soundfile python-fsspec python-protobuf python-soundfile python-tensorboardx python-pytorch)
makedepends=(python-hatchling python-installer python-build python-wheel python-setuptools)
provides=(python-coqui-ai-trainer)
conflicts=(python-coqui-ai-trainer)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/idiap/coqui-ai-Trainer/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('bc49887dca865f70514dc41581cb9052')

build() {
  cd $_pkgname-$pkgver
  python -m build --no-isolation --wheel
}
package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
