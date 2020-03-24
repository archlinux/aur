# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-imgaug
pkgver=0.4.0
pkgrel=1
pkgdesc="Image augmentation for machine learning experiments"
url="https://github.com/aleju/imgaug"
depends=('python' 'python-six' 'python-numpy' 'python-scipy' 'python-scikit-image')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("imgaug-$pkgver.tar.gz::https://github.com/aleju/imgaug/archive/$pkgver.tar.gz")
sha256sums=('fae8ed6e038b57fd7d8f55d813dee3f3784da36368bdf902879fd40ecf5ed7e2')

build() {
    cd $srcdir/imgaug-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/imgaug-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
