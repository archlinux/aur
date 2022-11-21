# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python38-rfc3986
pkgver=2.0.0
pkgrel=1
pkgdesc="Validating URI References per RFC 3986"
arch=('any')
license=('Apache')
url="https://rfc3986.readthedocs.org/"
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest')
source=("https://pypi.io/packages/source/r/rfc3986/rfc3986-$pkgver.tar.gz")
sha512sums=('5c8370cb1e21811eaab91269b9a30972b8fbcbe1fa1d806fd3ceabe0e1937de856d757146137fee470fbdbcc7e948b236f72a42306da41a6d03807e7333983df')

build() {
  cd rfc3986-$pkgver
  python3.8 setup.py build
}

check() {
  cd rfc3986-$pkgver
  PYTHONPATH="$PWD/build/lib" pytest
}

package() {
  cd rfc3986-$pkgver
  python3.8 setup.py install --root="$pkgdir/" --optimize=1
}
