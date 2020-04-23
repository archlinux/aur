# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>

pkgname=python-javascripthon
pkgver=0.11
pkgrel=1
pkgdesc="A Python 3 to ES6 Javascript translator "
arch=('any')
url="https://github.com/metapensiero/metapensiero.pj"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-macropy' 'python-dukpy')
source=("https://github.com/metapensiero/metapensiero.pj/archive/v${pkgver}.tar.gz")
sha512sums=('41f7f18ca5fbb8326e0bc9e74ccbbdd769b8eb8fcda1a4ea33898d816f4146e7102a59595acb5a78b6e4956b46bffbd7b396e21dee926d3f4725275d8b0ec0ea')

build() {
  cd "$srcdir/metapensiero.pj-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/metapensiero.pj-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
