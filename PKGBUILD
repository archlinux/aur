# Maintainer: Franck Lucien Duriez <franck.lucien.duriez@gmail.com>

pkgname=nrfutil
pkgver=5.2.0
pkgrel=1
pkgdesc="nrfutil command line utility and the nordicsemi library"
arch=('any')
url="https://github.com/NordicSemiconductor/pc-nrfutil"
license=('MIT')
depends=('python2')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/NordicSemiconductor/pc-nrfutil/archive/v$pkgver.tar.gz")
sha256sums=(SKIP)

build() {
  cd "$srcdir/pc-$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/pc-$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
