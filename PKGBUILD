# Maintainer: Adrian Freund <freundadrian@gmail.com>

pkgname=('python2-javascriptcore2-git')
_pkgname='pyjavascriptcore'
pkgver=v1.0.r2.gdb9d8e9
pkgrel=1
pkgdesc="Javascript Core for Python (When using WebKit2Gtk)"
url="https://github.com/freundTech/pyjavascriptcore"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('python2' 'cython2' 'webkit2gtk')
provides=('python2-javascriptcore2')
conflicts=('python2-javascriptcore2')
makedepends=('pkg-config')
source=("git://github.com/freundTech/pyjavascriptcore.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

