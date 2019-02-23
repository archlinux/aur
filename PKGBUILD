# Maintainer: Yaron de Leeuw < me at jarondl dot net >
pkgname=python-logfury
pkgver=0.1.2
pkgrel=1
pkgdesc="Responsible, low-boilerplate logging of method calls for python libraries"
arch=('any')
url="https://github.com/ppolewicz/logfury"
license=('BSD')
depends=('python' 'python-funcsigs' 'python-six>=1.10')
makedepends=('python-setuptools')
source=("logfury-${pkgver}.tar.gz::https://github.com/ppolewicz/logfury/archive/${pkgver}.tar.gz")
sha512sums=('626965bbb8bdebcd7f71fa141de24c7f725933a32f0a00c8799d9778fb41913666c2ef0c71660bf6d00b160b9e34baff682520f4c3570fb0e347f070f010172c')

build() {
  cd "$srcdir/logfury-$pkgver"
  python setup.py build
}
  

package() {
  cd "$srcdir/logfury-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -D LICENSE.txt "$pkgdir/usr/share/licenses/python2-logfury/LICENSE.txt"
}


