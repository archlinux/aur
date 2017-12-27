# Maintainer: Hugo Posnic <hugo.posnic@gmail.com>
# Author: Hugo Posnic <hugo.posnic@gmail.com>
# Author: Nathan Seva <nathan.seva@outlook.fr>
pkgname=imeditor
pkgver=0.6
pkgrel=1
pkgdesc="Simple & versatile image editor."
arch=("any")
url="https://github.com/ImEditor/ImEditor"
license=("GPL")
depends=("python" "python-setuptools" "python-pillow" "gtk3")
source=("$url/archive/$pkgver.tar.gz")
md5sums=("bbbe01247c2fd86fee7a2a1d08cc7365")

build() {
    cd "$srcdir/ImEditor-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/ImEditor-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
