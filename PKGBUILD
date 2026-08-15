# Maintainer: GalaxySnail <me+aur@glxys.nl>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Marcin Kulik <marcin@asciinema.org>

_pkgname=asciinema
pkgname=python-asciinema
pkgver=2.4.0
pkgrel=1
pkgdesc='Record and share terminal sessions (legacy 2.x Python implementation)'
arch=(any)
url='https://asciinema.org/'
license=(GPL-3.0-only)
conflicts=(asciinema)
provides=(asciinema)
depends=(python)
makedepends=(
  git
  python-setuptools
  python-wheel
  python-build
  python-installer
)
source=("git+https://github.com/asciinema/asciinema#tag=v$pkgver") # tag: v2.4.0
sha256sums=('ad52df52cc18d58477d7eb8d0e9897f3c6834693c3dd13c9b97e0dcc88908685')

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/asciinema-$pkgver-py3-none-any.whl
}
