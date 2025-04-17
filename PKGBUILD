# Maintainer: Antrax
# Contributor: Antrax <fredcox at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=hyprtiler
_origpkgname=hyprtiler
pkgver=0.1.2
pkgrel=1
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

source=("https://files.pythonhosted.org/packages/47/3e/5c106095f03a8cabd5545e9cb51210205a478466fe500a8e310c861c309d/hyprtiler-0.1.2.tar.gz")
md5sums=('a56d6718b73f8c9cdea077a4d87265ba')

package() {
  cd "${_origpkgname}-${pkgver}" || exit
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

