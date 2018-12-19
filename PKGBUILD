# Maintainer: Daniel Fernandez Rodriguez <gmail.com daferoes>
pkgname=python-cec
pkgver=0.2.7
pkgrel=1
pkgdesc="libcec bindings for Python"
arch=('any')
url="https://github.com/trainman419/python-cec"
license=('GPL')
depends=('libcec') #Fixes raspberry pi dependency of package libcec-rpi which provides libcec but no version specified. (https://archlinuxarm.org/packages/armv7h/libcec-rpi/files/PKGBUILD)
makedepends=('git' 'python2-setuptools')
source=("https://github.com/trainman419/python-cec/archive/$pkgver.tar.gz")
md5sums=('7aa445c7616a152d8ae357248f6306be')

build() {
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py install --root="$pkgdir"
}
