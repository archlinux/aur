# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=termtosvg
pkgver=0.6.0
pkgrel=1
pkgdesc='Record terminal sessions as SVG animations'
arch=('any')
url=https://nbedos.github.io/termtosvg/
license=('BSD')
depends=('python-lxml' 'python-pyte')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('b02b30dc75a326ba96c68a1964858aeef8538f171189f8cf26bbbb3ba03dbdbf2cb091ea5d5d2a258aa087771673179ae0b8c7dbddb2244eb7563266f765f8e5')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
