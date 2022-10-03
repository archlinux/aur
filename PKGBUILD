# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=python-gettext
pkgver=4.1
pkgrel=1
pkgdesc="Python implementation of Gettext"
arch=('any')
url="https://pypi.org/project/python-gettext/"
license=('GPL3')
depends=(python)
makedepends=(python-setuptools)
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('bd06f141d585db3258390e2381678cb0efde586a36bf3ab6aee5ced7dc8d6ffb')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
