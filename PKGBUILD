# Maintainer: Antrax
# Contributor: Antrax <fredcox at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=hyprtiler
_origpkgname=hyprtiler
pkgver=0.1.18
pkgrel=2
pkgdesc="A utility tool for managing windows in the Hyprland compositor environment."
arch=("x86_64")
url="https://github.com/antrax2024/hyprtiler"
license=("MIT")
depends=(
  "python"
  "python-rich"
  "confz"
)
makedepends=(
  "python-build"
  "python-installer"
  "python-wheel"
  "python-setuptools"
  "python-hatchling"
)

source=("https://files.pythonhosted.org/packages/1d/0e/607b7bfe60f52a15f6ccd398384084bec70a3073da7bfd2747677fb485e4/hyprtiler-0.1.18.tar.gz")
md5sums=('2d5236d19c6620320aea8d393f55723d')

package() {
  cd "${_origpkgname}-${pkgver}" || exit
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

