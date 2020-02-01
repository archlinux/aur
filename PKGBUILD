# Maintainer: Joseph Carta <cartakid@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributer: Allan McRae <allan@archlinux.org>

pkgname=python37-six
pkgver=1.14.0
pkgrel=1
pkgdesc="Python 2 and 3 compatibility utilities"
arch=('any')
url="https://pypi.python.org/pypi/six/"
license=('MIT')
depends=('python37')
#makedepends=('python-setuptools' 'python2-setuptools')
#checkdepends=('python-pytest' 'python2-pytest' 'tk')
source=("https://pypi.io/packages/source/s/six/six-$pkgver.tar.gz")
sha512sums=('4dea0f4e7961e8b582d665501c65852dc3b73516a0b6f78b0888c8670f1450df58bd3eea418777f41080b842ab6c3d8633be1034bcf920192e5590d5316e2c9e')

build() {
  cp -a six-$pkgver{,-py2}
}

#check() {
#  cd "$srcdir"/six-$pkgver
#  python3.7 -m pytest
#}

package () {
  cd six-$pkgver
  python3.7 setup.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
