# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-rstr
_pkgname=rstr
pkgver=2.2.6
pkgrel=3
pkgdesc="Generate random strings in Python"
arch=('x86_64')
depends=('python')
makedepends=('python-setuptools')
url="https://bitbucket.org/leapfrogdevelopment/rstr"
license=('BSD')
source=("https://pypi.python.org/simple/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('5dea822326e418e0c9816c9cd14ae9c7be2d4cd4334043c397f202bc2ae2eda4')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
