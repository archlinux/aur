# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python38-appdirs
pkgver=1.4.4
pkgrel=7
pkgdesc='A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir".'
arch=('any')
url="https://github.com/ActiveState/appdirs"
license=('MIT')
depends=('python38')
makedepends=('python38-setuptools')
source=("https://pypi.io/packages/source/a/appdirs/appdirs-$pkgver.tar.gz")
sha512sums=('8b0cdd9fd471d45b186aa47607691cf378dabd3edc7b7026a57bd6d6f57698e86f440818a5e23ba4288b35d6bb8cb6eb0106eae8aab09d8863ee15025d300883')

build() {
  cd appdirs-$pkgver
  python3.8 setup.py build
}

check() {
  cd appdirs-$pkgver
  python3.8 setup.py test
}

package() {
  cd appdirs-$pkgver
  python3.8 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et: