# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgbase=python-gettext
pkgname=('python-gettext' 'python2-gettext')
pkgver=3.0
pkgrel=1
pkgdesc="Python implementation of Gettext"
arch=('any')
url="https://github.com/hannosch/python-gettext"
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hannosch/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('a4bcc3cdb0a7f2068aa221c4f765c98468b62277f4b65170ffa6244e3456f451')

prepare() {
    cp -a python{,2}-gettext-$pkgver
}

package_python-gettext() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}

package_python2-gettext() {
    cd "$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}
