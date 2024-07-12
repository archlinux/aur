# Maintainer: Anton Kuklin <HAZZA@archlinux.org>

pkgname=sd-cli
pkgver=r2.63c2f0c
pkgrel=1
pkgdesc="cli for creating bots templates created for skfx"
arch=('any')
url="https://github.com/skfxio/sd-cli"
license=('custom')
depends=('python3' 'python-pip')
source=("git+https://github.com/skfxio/sd-cli.git")
sha512sums=('SKIP')

makedepends=(
  git
  python-build
  python-hatchling
  python-installer
)

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" ${pkgname}/dist/*.whl
}



