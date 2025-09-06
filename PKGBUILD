# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-daff
_name=${pkgname#python-}
pkgver=1.4.2
pkgrel=1
pkgdesc='Align and compare tables'
arch=(any)
url='https://github.com/paulfitz/daff'
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools haxe)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('6a66d11de2ac4f466f30f0bb69edaa7cc9c003ef13a4cd3193adc67ec9b38c49dcf5e9404ab01fd26c5ccb0b73d5f46f37b375a44ce20b4e179838e7f66c3ac5')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
