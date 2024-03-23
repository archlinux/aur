# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-derpconf
_name=${pkgname#python-}
pkgver=0.8.4
pkgrel=3
pkgdesc='abstract loading of configuration files'
arch=(any)
url='https://github.com/globocom/derpconf'
license=(MIT)
depends=(python python-six)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('d0457481147a3ed8fa059f7022fede1577eca70a2818560e662715c58d995bee6a972925b01566d8f564f807ba8885a53a5e162de96f698ef9b7aaeb35f9da3b')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
