# Maintainer: piernov <piernov@piernov.org>

pkgname=python-gputils
pkgver=1.4.0
pkgrel=1
pkgdesc="Python module for getting the GPU status from NVIDA GPUs using nvidia-smi"
arch=('any')
url="https://github.com/anderskm/gputil"
license=('MIT')
depends=('nvidia-utils')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::"https://github.com/anderskm/gputil/archive/v${pkgver}.tar.gz")
sha512sums=('ce41b727fe958d8cb0c029b9551aca9df33348ed385a7ec707fb2f131e84e7783e1446239da131c2ea04784f0f9e713fad861de55438404d549f6f6fee521d47')

build() {
  cd gputil-$pkgver
  python setup.py build
}

package() {
  cd gputil-$pkgver
  python setup.py install --root "$pkgdir" --prefix=/usr --optimize=1 --skip-build
}
