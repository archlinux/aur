# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='pumpkinlb'
_realName=PumpkinLB
pkgdesc="A simple, fast, pure-python load balancer"
pkgver=2.0.0
pkgrel=2
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/PumpkinLB"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/PumpkinLB/archive/${pkgver}.tar.gz")
sha512sums=("5bc46a51bc812f40c9bf7d944a13bc7112647419db48849a93b3231b91b96d1ba29e041eb2c36867e96db71a4d544ad67437850658c3e819f07ac1ac87a60c82")

build() {
  cd "$srcdir/${_realName}-$pkgver"
  python setup.py build
}

package() {
  cd "${_realName}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

