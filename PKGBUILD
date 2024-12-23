# Maintainer: envolution
# Contributor: Chris Brendel <cdbrendel@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-confection
_origpkgname=confection
pkgver=0.1.5
pkgrel=2
pkgdesc="The sweetest config system for Python"
arch=("x86_64")
url="https://github.com/explosion/confection"
license=("MIT")
depends=("python" "python-pydantic" "python-typing_extensions" "python-srsly")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/confection/archive/v$pkgver.tar.gz")
md5sums=('0c942590cf3e48c353d7d1da23c99ce7')

package() {
  cd "$_origpkgname-$pkgver"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
