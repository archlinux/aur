# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-imgaug
pkgver=0.3.0
pkgrel=1
pkgdesc="Image augmentation for machine learning experiments"
url="https://github.com/aleju/imgaug"
depends=('python' 'python-six' 'python-numpy' 'python-scipy' 'python-scikit-image')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("imgaug-$pkgver.tar.gz::https://github.com/aleju/imgaug/archive/$pkgver.tar.gz")
sha256sums=('bd2a457221e9a3bb7d6e096f149c27517145cefd5cb8f7919b07678dfd36c663')

build() {
    cd $srcdir/imgaug-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/imgaug-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
