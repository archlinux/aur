# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pynput' 'python2-pynput')
pkgver=1.4.4
pkgrel=1
_name=pynput
pkgdesc="Python library to monitor and control user input devices"
arch=('any')
url="https://github.com/moses-palmer/pynput"
license=('LGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moses-palmer/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('6145aa134e15dcfcaf04ec65c8c05a07b457a78030f8bfed44620bc2590773d3be4707ae619c1afdcb25f0587faf0c8aa932cc0af53aaa999d634f68ce4e5193')
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
