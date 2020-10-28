# Maintainer: Mario Ortiz Manero <marioortizmanero@gmail.com>
pkgname=python-readchar
pkgver=2.0.0
pkgrel=1
pkgdesc="Python library to read characters and key strokes"
arch=("any")
url="https://github.com/magmax/python-readchar"
license=("custom:MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/magmax/python-readchar/archive/$pkgver.tar.gz"
        "LICENSE")
md5sums=('cdc776bd6105c3795a4fc65054b635e3'
         '6fe7ddd14c619721d6db734a05d7d423')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
