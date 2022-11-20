# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python38-tomli-w
pkgver=1.0.0
pkgrel=5
pkgdesc="A lil' TOML writer"
url=https://github.com/hukkin/tomli-w
license=(MIT)
arch=(any)
depends=(python38)
makedepends=(
  git
  python38-build
  python38-flit-core
  python38-installer
)
checkdepends=(
  python38-pytest
  python38-tomli
)
_tag=19099125f32e7c491603e393263754262b356956
source=(git+https://github.com/hukkin/tomli-w.git#tag=${_tag})
b2sums=(SKIP)

pkgver() {
  cd tomli-w
  git describe --tags
}

build() {
  cd tomli-w
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd tomli-w
  python3.8 -m pytest
}

package() {
  python3.8 -m installer --destdir="${pkgdir}" tomli-w/dist/*.whl
  install -Dm 644 tomli-w/LICENSE -t "${pkgdir}"/usr/share/licenses/python38-tomli-w/
}

# vim: ts=2 sw=2 et:
