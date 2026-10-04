# Maintainer: Microwave_Chef <pabloreturnss@protonmail.com>

_commit=ddaa29b24d9c9d11afeafe7f8ebc56fd12e15c62
pkgname=psptool
pkgver=3.7
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
sha512sums=('9f01ea9e7f3c4b7ad4938e2eab0d9f17d2db9a36e2e34497c50d325b18aaa49b65dd8164e782f5f9a237ea7b505a220d0cf001cda5d105918df6d7c6db98a84d')

package() {
  cd "PSPTool-$_commit"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
