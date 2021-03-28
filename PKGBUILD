# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=python-pygogo
_pkgname=pygogo
pkgver=0.13.2
pkgrel=1
pkgdesc="A python logging library with superpowers"
arch=(any)
url='https://github.com/reubano/pygogo'
license=(MIT)
depends=('python' 'python-pkutils')
makedepends=('python-pygments' 'python-setuptools' 'python-pip')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/reubano/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=("ea0cc82fd62329255ec5212495b65307b172ab5709906e15fcb3cc1ded952918")

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
