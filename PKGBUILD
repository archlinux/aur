# Maintainer: Stewart Webb <stew@rtwebb.com>

pkgbase=python-autologging
pkgname=('python-autologging')
pkgver=1.3.2
pkgrel=1
pkgdesc="easier logging and tracing for Python classes"
arch=('any')
url="https://github.com/mzipay/Autologging"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=()
source=("$pkgbase-$pkgver.tar.gz::https://github.com/mzipay/Autologging/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('430612aed6b0ed83833f29b8fbf66e0b09be97a34ad72018c572f04f2602af5e958f4da0550f481b9da201f91698b35a347a9ce8e211e9a4b37677032f659be5')


build() {
  cd "$srcdir"/Autologging-$pkgver
  python setup.py build
}

check() {
  cd Autologging-$pkgver
  python setup.py test
}

package() {
  cd "$srcdir"/Autologging-$pkgver
  python setup.py install --skip-build -O1 --root="$pkgdir"
}

