
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-rstr
pkgver=2.2.6
pkgrel=2
pkgdesc="Generate random strings in Python"
arch=('x86_64')
depends=('python')
makedepends=('python-setuptools')
url="https://bitbucket.org/leapfrogdevelopment/rstr"
license=('BSD')
source=(https://pypi.python.org/packages/be/52/f87d6a9c691329dc71eaa6263f63cc262bd818df89e2dc981720db9dc9c5/rstr-${pkgver}.tar.gz)
md5sums=('be2d1a655e3adb5d55db981846fe9761')

build() {
  cd "${pkgname#python-}-$pkgver"
  python setup.py build
}

package() {
  cd "${pkgname#python-}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
