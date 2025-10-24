# Contributor: Daniel E. Shub <daniel.e.shub@gmail.com>

pkgname=python-javascripthon
pkgver=0.13
pkgrel=2
pkgdesc="A Python 3 to ES6 Javascript translator "
arch=('any')
url="https://github.com/metapensiero/metapensiero.pj"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python' 'python-dukpy')
source=("https://github.com/metapensiero/metapensiero.pj/archive/v${pkgver}.tar.gz")
sha512sums=('bf919524785423579304f4e5c20748a11ab21d6548b946dc7c6efa34fc5ee7394683f2c80edd8a065af340ea7a9bd88c96761a871c61a022cbbd1fd518b99848')

build() {
  cd "$srcdir/metapensiero.pj-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/metapensiero.pj-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
