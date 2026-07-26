# Maintainer: Daniel Maslowski <info@orangecms.org>

_commit=d8f676ad9ab9979b92f070b96e44506c47db8971
pkgname=psptool
pkgver=3.6
pkgrel=1
pkgdesc="Swiss Army knife for dealing with firmware of the AMD Secure Processor"
arch=('any')
url="https://github.com/PSPReverse/PSPTool"
license=('GPL3')
depends=(
  'python-cryptography'
  'python-prettytable'
)
makedepends=(
  'python-hatchling'
  'python-hatch-vcs'
  'python-build'
  'python-installer'
)
provides=("$pkgname")
conflicts=("${pkgname}-git")
source=(https://github.com/PSPReverse/$pkgname/archive/$_commit.tar.gz)
sha512sums=('56d9e33abb82bacda7dc57a86b23a17558ffae4979f1c09edf69909394cc265f8941e5dc2aa5821dbcc12aa355b6f483f367ff12bc5e863a3eb4034426d01d45')

package() {
  cd "PSPTool-$_commit"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
