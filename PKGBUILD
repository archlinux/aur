# Maintainer:  Boudewijn van Groos <github dot com slash Boudewijn26>
# Contributor: Tembleking <tembleking at gmail dot com>

pkgname=python-gtts-token
pkgver=1.1.1
pkgrel=1
pkgdesc="Token for gTTS"
arch=('any')
url="https://github.com/Boudewijn26/gTTS-token"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname::https://pypi.python.org/packages/4c/c8/dd58eba1464729095217d3acfc4f6581348c6f495ea3342ed7dbc9f9e133/gTTS-token-1.1.1.zip#md5=39f56680d81c3d553ccc663f013a48f8")

prepare() {
  unzip -o -V "$pkgname"
}

build() {
  cd "$srcdir/gTTS-token-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/gTTS-token-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
md5sums=('39f56680d81c3d553ccc663f013a48f8')
