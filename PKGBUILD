# Maintainer: Claudio Kozický <claudiokozicky@gmail.com>

pkgname=beets-extrafiles
pkgver=0.0.7
pkgrel=3
pkgdesc="A plugin for beets that copies additional files and directories during the import process."
arch=('any')
url="https://github.com/Holzhaus/beets-extrafiles"
license=('MIT')
depends=('beets')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Holzhaus/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('1b47be1553c3e3839192bdfa64754c3769f841263b6ef714a19e80bf3f978d7c8920cdb8e9d788fbb1c6e2805c48ab67e9ad69d4872e94c20d3d485f8aaff17e')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

check() {
    cd "$pkgname-$pkgver"
    python setup.py test
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --optimize=1 --root="$pkgdir" --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
