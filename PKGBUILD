# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-deprecation-alias
pkgver=0.4.0
pkgrel=1
pkgdesc='A wrapper around deprecation providing support for deprecated aliases'
arch=(any)
url='https://github.com/domdfcoding/deprecation-alias'
license=(Apache-2.0)
depends=(python python-deprecation python-packaging)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools
  python-hatchling
  python-hatch-requirements-txt
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('0574311323b03f0b07734dc3d9ef6e5b26c4b1bab1181473f78cf83f463a36b65d4a1ece37c6b12461263ed6ba5607717b4590443738bb656e8caf28b0163351')
b2sums=('c42c7c3e91f652b790cf3058a34f79c4eca540dc20eacfb0d86d5128adb82ae08dc138924c18e893f19fecdaa79372cd4c5bf97dea592985cf3ad0838173a9bf')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
