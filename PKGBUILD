# Maintainer: Antrax
# Contributor: Antrax <fredcox at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=hyprtiler
_origpkgname=hyprtiler
pkgver=0.1.21
pkgrel=1
pkgdesc="A utility tool for managing windows in the Hyprland compositor environment."
arch=("x86_64")
url="https://github.com/antrax2024/hyprtiler"
license=("MIT")
depends=(
  "python"
  "python-rich"
  "python-click"
)
makedepends=(
  "python-build"
  "python-installer"
  "python-wheel"
  "python-setuptools"
  "python-hatchling"
)

source=("https://files.pythonhosted.org/packages/6b/6a/b9414063a73e141746a20b149a7ccd6c2d4a485a1ede57ae74ce2c84c7bc/hyprtiler-0.1.21.tar.gz")
sha256sums=("bc991cecaca47f1eed82718addc77e409445ea3940655d69fc3dd8be936b823c")

package() {
  cd "${_origpkgname}-${pkgver}" || exit
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

