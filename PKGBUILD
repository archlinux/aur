# Maintainer: Antrax
# Contributor: Antrax <fredcox at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=py-nvfan
_origpkgname=py_nvfan
pkgver=0.1.18
pkgrel=1
pkgdesc="Automatic Fan Control for NVIDIA Graphics Cards Based on Temperature."
arch=("x86_64")
url="https://github.com/antrax2024/py-nvfan/"
license=("MIT")
depends=(
  "python"
  "python-pynvml"
  "python-rich"
  "confz"
  "xorg-xhost"
  "nvidia-settings"
)
makedepends=(
  "python-build"
  "python-installer"
  "python-wheel"
  "python-setuptools"
  "python-hatchling"
)

source=("https://files.pythonhosted.org/packages/aa/bb/2f30019493e63fb2fd82f1fd677cb91eaa7b4a2ae995213429ee16970af5/py_nvfan-0.1.18.tar.gz")
md5sums=('192da6caf112dba0a741f9041fdddb0e')

package() {
  cd "${_origpkgname}-${pkgver}" || exit
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

