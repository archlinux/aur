# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

_pkgname='kiwi'
pkgname=('python-kiwi')
pkgver=8.20.22
pkgrel=1
pkgdesc="KIWI—Appliance Builder Next Generation"
arch=('any')
url="https://github.com/SUSE/$_pkgname"
license=('MIT')
options=()
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e6152a71086827b67a2ed80a4363ee6d8d33448a02585479c2d4e69d4099fc30')
depends=('python-future' 'python-xattr' 'python-lxml' 'python-docopt')
makedepends=('python-setuptools' 'python-sphinx' 'python-sphinxcontrib-spelling'
             'python-sphinxcontrib-programoutput')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
  make -C doc man
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
