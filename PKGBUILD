# Maintainer: Adrian Freund <freundadrian@gmail.com>

pkgname=('python-javascriptcore2-git')
_pkgname='pyjavascriptcore'
pkgver=v1.0.r2.gdb9d8e9
pkgrel=1
pkgdesc="Javascript Core for Python (When using WebKit2Gtk)"
url="https://github.com/freundTech/pyjavascriptcore"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('python' 'cython' 'webkit2gtk')
makedepends=('pkg-config')
provides=('python-javascriptcore2')
conflicts=('python-javascriptcore2')
source=("git://github.com/freundTech/pyjavascriptcore.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

