# Maintainer: Tim Schumacher <timschumi@gmx.de>

pkgname=python-pytube3
pkgver=9.6.4
pkgrel=2
pkgdesc="Python 3 library for downloading YouTube Videos."
arch=('any')
license=('MIT')
url="https://github.com/get-pytube/pytube3"
depends=('python-setuptools' 'python-typing_extensions')
source=("https://pypi.io/packages/source/p/pytube3/pytube3-$pkgver.tar.gz")
sha512sums=('e15d82c4b09e227bb35566edcc3e1014af8cce7af09735ec174550f227a964fc7225941e7ade6e15cba237434bd2d55306dd87b75a1356835abc5982665941f2')

build() {
  cd pytube3-$pkgver
  python setup.py build
}

package() {
  cd pytube3-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

