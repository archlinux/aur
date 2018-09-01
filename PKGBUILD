# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-imgaug
pkgver=0.2.6
pkgrel=1
pkgdesc="Image augmentation for machine learning experiments"
url="https://github.com/aleju/imgaug"
depends=('python' 'python-six' 'python-numpy' 'python-scipy' 'python-scikit-image')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("imgaug-$pkgver.tar.gz::https://github.com/aleju/imgaug/archive/$pkgver.tar.gz")
sha256sums=('79ea496780bfb2d7390759bb578c2a8444bfc09188b28b5c0e4bc74b7f14b9c7')

build() {
    cd $srcdir/imgaug-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/imgaug-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
