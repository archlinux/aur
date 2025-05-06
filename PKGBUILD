# Maintainer: Antrax
# Contributor: Antrax <fredcox at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=hyprtiler
_origpkgname=hyprtiler
pkgver=0.1.23
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

source=("https://files.pythonhosted.org/packages/76/e8/1fa1984901fe01a9c3239bf7bb1a0b35bae4356007e95b813e70082fc6e4/hyprtiler-0.1.23.tar.gz")
sha256sums=("12668f3d5367b063fbb953245807b05f542006e36eda5c63ae7dac57787cbdb6")

package() {
  cd "${_origpkgname}-${pkgver}" || exit
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

