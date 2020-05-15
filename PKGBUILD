# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Abhishek Mudgal
# Contributor: Ivan Semkin (ivan at semkin dot ru)

_pkgname=vdf
pkgname=(python2-vdf)
pkgver=3.3
pkgrel=1
pkgdesc="Library for working with Valve's VDF text format"
arch=('any')
url='https://github.com/ValvePython/vdf'
license=('MIT')
depends=(python2)
makedepends=(python2-setuptools)
checkdepends=(python2 python2-nose python2-coverage python2-mock)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ValvePython/vdf/archive/v$pkgver.tar.gz")
sha256sums=('554ef526e779f475d686a19d9abd90f3f0325286127f6dc643e7f6ea03490cce')

build() {
  cd "$_pkgname-$pkgver"
  python2 setup.py build
}

check() {
  cd "$_pkgname-$pkgver"
  python2 setup.py test
}

package() {
  cd "$_pkgname-$pkgver"
  python2 setup.py install --optimize=1 --root="${pkgdir}/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
