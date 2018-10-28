# Maintainer: Hugo Posnic <hugo.posnic@gmail.com>
# Author: Hugo Posnic <hugo.posnic@gmail.com>
# Author: Nathan Seva <nathan.seva@outlook.fr>
pkgname=imeditor
pkgver=0.7
pkgrel=1
pkgdesc="Simple & versatile image editor."
arch=("any")
url="https://github.com/ImEditor/ImEditor"
license=("GPL")
depends=("python" "python-setuptools" "python-pillow" "gtk3")
source=("$url/archive/$pkgver.tar.gz")
md5sums=("ec01586f616e4db3bc84d5e0d8756fab")

build() {
    cd "$srcdir/ImEditor-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/ImEditor-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
