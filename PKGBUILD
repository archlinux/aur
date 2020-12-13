# Maintainer: Claudio Kozický <claudiokozicky@gmail.com>

pkgname=beets-extrafiles
pkgver=0.0.7
pkgrel=2
pkgdesc="A plugin for beets that copies additional files and directories during the import process."
arch=('any')
url="https://github.com/Holzhaus/beets-extrafiles"
license=('MIT')
depends=('beets')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Holzhaus/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('977f8851b0c038ea78f7142d1d8dafbb9712182c2315973f3a24027eed2e4ee9')

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
