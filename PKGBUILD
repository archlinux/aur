# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-imgaug
pkgver=0.2.8
pkgrel=1
pkgdesc="Image augmentation for machine learning experiments"
url="https://github.com/aleju/imgaug"
depends=('python' 'python-six' 'python-numpy' 'python-scipy' 'python-scikit-image')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("imgaug-$pkgver.tar.gz::https://github.com/aleju/imgaug/archive/$pkgver.tar.gz")
sha256sums=('3c40c8e9b06277d258368129376151d2cb41c2523353719f646b2448c9d18fea')

build() {
    cd $srcdir/imgaug-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/imgaug-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
