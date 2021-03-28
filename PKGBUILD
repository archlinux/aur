# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=python-pkutils
_pkgname=pkutils
pkgver=1.2.1
pkgrel=2
pkgdesc="A python packaging utility library"
arch=(any)
url='https://github.com/reubano/pkutils'
license=(MIT)
depends=('python' 'python-semver')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/reubano/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("42e02c0f022ae6663000de741b818e226a60c4c6983614c87770c0d5321bf217")

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
