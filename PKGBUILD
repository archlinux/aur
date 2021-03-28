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
sha256sums=("2effded9665a19573e71f5431c9d79f9215da6f894a12251187a3254d2310df9")

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
