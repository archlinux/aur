# Maintainer: Daniel Fernandez Rodriguez <gmail.com daferoes>
pkgname=python-cec
pkgver=0.2.8
pkgrel=1
pkgdesc="libcec bindings for Python"
arch=('any')
url="https://github.com/trainman419/python-cec"
license=('GPL')
depends=('libcec') #Fixes raspberry pi dependency of package libcec-rpi which provides libcec but no version specified. (https://archlinuxarm.org/packages/armv7h/libcec-rpi/files/PKGBUILD)
makedepends=('git' 'python-setuptools')
source=("https://github.com/trainman419/python-cec/archive/$pkgver.tar.gz")
md5sums=('815af2351abb5243039585f8ec7d6bc1')

build() {
    cd $srcdir/$pkgname-$pkgver
    python3 setup.py build
}

package() {
    cd $srcdir/$pkgname-$pkgver
    python3 setup.py install --root="$pkgdir"
}
