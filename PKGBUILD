# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mimerender
pkgver=0.6.0
pkgrel=8
pkgdesc="Transparently select a render function for an HTTP request handler's result"
arch=('any')
url="https://github.com/martinblech/mimerender"
license=('MIT')
depends=('python-mimeparse')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/martinblech/mimerender/archive/v$pkgver.tar.gz")
sha512sums=('68c584ba8ae608097b739078dd729bd8b5493087901ba281959abdb81d4e6052ff045c487fde4f67744b413bab36d7f938c68b162049ebe33bff642571b8fd98')

build() {
  cd mimerender-$pkgver
  python setup.py build
}

check() {
  cd mimerender-$pkgver
  python src/test.py
}

package() {
  cd mimerender-$pkgver
  python setup.py install -O1 --root "$pkgdir"
}
