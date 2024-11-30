# Maintainer: envolution
# Contributor: caiye <ye dot jingchen at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-pynat
_module='pynat'
pkgver=0.7.0
pkgrel=1
pkgdesc="Discover external IP addresses and NAT topologies using STUN."
url="https://github.com/arantonitis/pynat"
makedepends=(python-wheel python-installer python-build)
depends=(python)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('96168d472b7abc47c348cd4f6c4c1f13180bdc8c796918b1e98b4de9d0a59ede')

build() {
  cd "${_module}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_module}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
