# Maintainer: Antrax
# Contributor: Antrax <fredcox at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=hyprtiler
_origpkgname=hyprtiler
pkgver=0.1.20
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

source=("https://files.pythonhosted.org/packages/9f/91/f3c5e623703f50163c9f91ef9e6eebe6310f4c82ff921142b653e4ecce8f/hyprtiler-0.1.20.tar.gz")
sha256sums=("0e1f6399e698c97697a2f231ef8dfdc96d4e980bab0d2d985d04b17658b4d086")

package() {
  cd "${_origpkgname}-${pkgver}" || exit
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

