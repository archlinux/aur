# Maintainer: Adrian Freund <freundadrian@gmail.com>

pkgname=('python-javascriptcore4-git')
_pkgname='pyjavascriptcore'
pkgver=v1.0.r3.gecefcdb
pkgrel=1
pkgdesc="Javascriptcore-4.0 for Python (for use with webkit2gtk-4.0)"
url="https://github.com/freundTech/pyjavascriptcore"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('python' 'cython' 'webkit2gtk')
makedepends=('pkg-config')
provides=('python-javascriptcore4')
conflicts=('python-javascriptcore4')
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

