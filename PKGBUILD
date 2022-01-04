# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python2-txaio
pkgver=21.2.1
pkgrel=2
pkgdesc='Compatibility API between asyncio/Twisted/Trollius'
arch=('any')
url="https://github.com/crossbario/txaio"
license=('MIT')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-mock' 'python2-twisted')
depends=('python2-six')
source=("https://pypi.io/packages/source/t/txaio/txaio-$pkgver.tar.gz")

prepare() {
 cp -a txaio-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/txaio-$pkgver-py2
  python2 setup.py build
}
 
package() {
  cd txaio-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
md5sums=('7e80b80ed7797245a5eef803043bdede')
