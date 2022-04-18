# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: incomplete <incomplete at axion dot co>
# Contributor: ribbons <aur dot ribbons at codefive dot co dot uk>

pkgname=python-vispy
pkgver=0.10.0
pkgrel=1
pkgdesc='A high-performance interactive 2D/3D data visualization library.'
arch=('any')
url='https://vispy.org'
license=('BSD')
depends=('python-numpy' 'python-hsluv' 'python-freetype-py' 'python-kiwisolver')
makedepends=('python-setuptools' 'python-pip' 'cython' 'npm')
optdepends=('ipython: ipython-static'
            'python-pyglet: pyglet'
            'python-pyqt5: pyqt5'
            'python-pyqt6: pyqt6'
            'pyside2: pyside2'
            'pyside6: pyside6'
            'python-pysdl2: sdl2'
            'python-wxpython: wx')
_pkgname=vispy
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vispy/vispy/archive/v$pkgver.tar.gz")
sha256sums=('f4f1b23d489ed783e1ee20f04fe2934b2b0f57e8dc86ff500e9ce32236b6de4f')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
