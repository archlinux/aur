# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pynput' 'python2-pynput')
pkgver=1.4
pkgrel=2
_name=pynput
pkgdesc="Python library to monitor and control user input devices"
arch=('any')
url="https://github.com/moses-palmer/pynput"
license=('LGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moses-palmer/pynput/archive/v${pkgver}.tar.gz")
sha512sums=('53706aefec1353df16ca9f9b213bb367fe0b695f26406d58a9171bcb47ddb92228914012c1915fc58d2e639de9100d452b38aafc95539ea16e6362a1831cc605')
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
