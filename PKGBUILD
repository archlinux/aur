# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=python-namedatomiclock
pkgver=1.1.1
pkgrel=2
pkgdesc='Python module for an atomic named interprocess lock which is local to the machine.'
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/NamedAtomicLock"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/NamedAtomicLock/archive/${pkgver}.tar.gz")
sha512sums=('e17be61a7d1e3ef34eac116ed0aa17afda5647ca9d27ed90db5d882f813b1b7747aa5e52cee1def6bd5875f825e31e2f7ca4218b7da647b68b7803104b9be49e')

build() {
  cd "$srcdir"/NamedAtomicLock-$pkgver
  python setup.py build
}

package() {
  cd NamedAtomicLock-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
