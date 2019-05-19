# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-imgaug
pkgver=0.2.9
pkgrel=1
pkgdesc="Image augmentation for machine learning experiments"
url="https://github.com/aleju/imgaug"
depends=('python' 'python-six' 'python-numpy' 'python-scipy' 'python-scikit-image')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("imgaug-$pkgver.tar.gz::https://github.com/aleju/imgaug/archive/$pkgver.tar.gz")
sha256sums=('f2f96f9120e07090abf6bf26bb24d4c20dd531d5fe14a5129f3ad8d941af28fe')

build() {
    cd $srcdir/imgaug-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/imgaug-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
