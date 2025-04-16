# Maintainer: Antrax
# Contributor: Antrax <fredcox at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=py-nvfan
_origpkgname=py_nvfan
pkgver=0.1.14
pkgrel=2
pkgdesc="Automatic Fan Control for NVIDIA Graphics Cards Based on Temperature."
arch=("x86_64")
url="https://github.com/antrax2024/py-nvfan/"
license=("MIT")
depends=(
  "python"
  "python-pynvml"
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

source=("https://files.pythonhosted.org/packages/63/0b/de7b8d63cc04371f00a6884450f23937819105fd9f59522745f1c1aea4af/py_nvfan-0.1.14.tar.gz")
md5sums=('dd7fe53b128abe5779531c8738df04b2')

package() {
  cd "${_origpkgname}-${pkgver}" || exit
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

