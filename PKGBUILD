# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pynput' 'python2-pynput')
pkgver=1.4.1
pkgrel=1
_name=pynput
pkgdesc="Python library to monitor and control user input devices"
arch=('any')
url="https://github.com/moses-palmer/pynput"
license=('LGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moses-palmer/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('b1026b76a1782ddf5d620e9d9330531c743800da2d4b40b590b4545c1a218983eb423d56291f3dd330060d10a6bfd40b3c5e4b2a7acc55c4b555bd49dd805475')
makedepends=('python-setuptools' 'python2-setuptools')

build() {
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py build
}

package_python-pynput() {
    depends=('python-xlib' 'python-six')
    optdepends=('python-sphinx: build online documentation')
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build;
}

package_python2-pynput() {
    depends=('python2-xlib' 'python2-six' 'python2-enum34')
    optdepends=('python2-sphinx: build online documentation')
    cd "$srcdir/${_name}-${pkgver}"
    python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build;
}
