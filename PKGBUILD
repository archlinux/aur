pkgname=android2po
pkgver=1.5.0
pkgrel=1
pkgdesc="Convert Android string resources to gettext, and back."
arch=('any')
url="https://github.com/miracle2k/$pkgname"
license=('BSD')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('8acc74534874cd215c3fc97ae1e0372a')
depends=('python2' 'python2-babel' 'python2-lxml' 'python2-argparse' 'python2-termcolor')
makedepends=('python2-setuptools')

build() {
  cd "$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python2 ./setup.py install --prefix=/usr --root="$pkgdir"
}
