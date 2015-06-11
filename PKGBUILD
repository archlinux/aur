# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-dill-git
pkgver=0.2.1.r87.g71b0181
pkgrel=1
pkgdesc='Serialize all of python (almost)'
arch=('any')
url='http://pypi.python.org/pypi/dill/'
license=('BSD')
depends=('python')
provides=('python-dill')
conflicts=('python-dill')
source=('git://github.com/uqfoundation/dill.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/dill"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/dill"
  python setup.py build
}

package() {
  cd "$srcdir/dill"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

