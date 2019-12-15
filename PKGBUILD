# Maintainer: wsyxbcl <wsyxbcl@gmail.com>
 
pkgname=python-calcmass
pkgver=1.5.1
pkgrel=1
pkgdesc='A molar mass calculator'
arch=('any')
license=('MIT')
url='https://github.com/wsyxbcl/Calcmass'
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wsyxbcl/Calcmass/archive/$pkgver.tar.gz")
sha512sums=('90e90effb7a34167d6a93c57d272728127c23d88f482eeb0a30e763d393e9a728ea4b363269cdf5972f51fc4c63e721ce0e0a50de2fff1e8cfc1704bda31c545')

build() {
  cd "$srcdir"/Calcmass-$pkgver
  python setup.py build
}
 
package() {
  depends=('python')
 
  cd Calcmass-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
 
# vim:set ts=2 sw=2 et:
