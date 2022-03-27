# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: yochanamarqos

pkgname=python-pygogo
_pkgname=pygogo
pkgver=1.2.0
pkgrel=1
pkgdesc="A python logging library with superpowers"
arch=(any)
url='https://github.com/reubano/pygogo'
license=(MIT)
depends=('python')
makedepends=('python-pygments' 'python-setuptools' 'python-pip' 'python-wheel' 'python-pkutils')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/reubano/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8752dbeb741b656f1c3bf7c83f6e268d5d8435b4268cd399dfd605ca0b3be6f2')

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
