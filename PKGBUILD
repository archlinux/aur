
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-rstr
pkgver=2.2.6
pkgrel=3
pkgdesc="Generate random strings in Python"
arch=('x86_64')
depends=('python')
makedepends=('python-setuptools')
url="https://bitbucket.org/leapfrogdevelopment/rstr"
license=('BSD')
source=(https://files.pythonhosted.org/packages/source/r/rstr/rstr-${pkgver}.tar.gz)
md5sums=('be2d1a655e3adb5d55db981846fe9761')

build() {
  cd "rstr-$pkgver"
  python setup.py build
}

package() {
  cd "rstr-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
