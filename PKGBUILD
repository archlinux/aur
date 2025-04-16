# Maintainer: Antrax
# Contributor: Antrax <fredcox at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=py-nvfan
_origpkgname=py_nvfan
pkgver=0.1.16
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

source=("https://files.pythonhosted.org/packages/a0/a6/d832ee057c2c5992ad0bbad981227b70b4871cc5e972e7203db8ff7c128c/py_nvfan-0.1.16.tar.gz")
md5sums=('1d421cf7aea0c492e7b891e844d52ff5')

package() {
  cd "${_origpkgname}-${pkgver}" || exit
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

