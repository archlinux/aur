# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Gaute Hope <eg@gaute.vetsj.com>
# Contributor: Melissa Padilla <mpadilla2 at hotmail dot com>

pkgname=python-future
pkgver=0.15.0
pkgrel=1
pkgdesc="Clean single-source support for Python 3 and 2"
url="http://python-future.org/"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-setuptools: futurize and pasteurize scripts')
options=(!emptydirs)
provides=('futurize' 'pasteurize')
source=("https://pypi.python.org/packages/source/f/future/future-$pkgver.tar.gz")
md5sums=('cf1ee211567cc0b1021de5839064fe7b')
sha256sums=('7f8ad46e287ac32e3dae78be41098c83d690b364142e0a5f11958c2b549420b0')

build() {
  cd "$srcdir/future-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/future-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
