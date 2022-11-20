# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-profilestats
pkgver=2.0
pkgrel=11
pkgdesc="Decorator for profiling individual functions and converting profiling data to the kcachegrind/qcachegrind format."
arch=('any')
license=('BSD')
url="https://github.com/hannosch/profilestats"
depends=('python38-setuptools' 'pyprof2calltree')
source=("https://github.com/hannosch/profilestats/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('918d23df8f076dc6b0be0dc70e8899f638d6a911472193624e6a7594a1b1c82975f0090dddbcdadcb0c6a0c11b2bb6f22fad11561322cdf962c719854663b23a')

build() {
  cd profilestats-$pkgver
  python3.8 setup.py build
}

package() {
  cd profilestats-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
