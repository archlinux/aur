# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pynput' 'python2-pynput')
pkgver=1.4.2
pkgrel=1
_name=pynput
pkgdesc="Python library to monitor and control user input devices"
arch=('any')
url="https://github.com/moses-palmer/pynput"
license=('LGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moses-palmer/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('59afc052739d2b9b0a6bc437244ef182d8cb39b0ed0cf37c643372079f2c736943f201cb5c4d8d0c8d5a8306e25d14c6ae26a5b5fd33f7a3c84d369359ae399a')
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
