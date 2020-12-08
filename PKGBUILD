# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgbase=python-gettext
pkgname=('python-gettext' 'python2-gettext')
pkgver=4.0
pkgrel=2
pkgdesc="Python implementation of Gettext"
arch=('any')
url="https://pypi.org/project/python-gettext/"
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.org/packages/source/${pkgbase:0:1}/$pkgbase/$pkgbase-$pkgver.tar.gz")
sha256sums=('626b501a51ac892fc3460cf550e60dca121f544eaa46eb69c90ce4682fc7ec02')

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
