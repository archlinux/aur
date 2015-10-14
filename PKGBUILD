# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=('python2-javascriptcore-git')
_pkgname='pyjavascriptcore'
pkgver=20130723
pkgrel=1
pkgdesc="Javascript Core for Python"
url="https://github.com/sumary/pyjavascriptcore"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('python2' 'cython2' 'pywebkitgtk')
makedepends=('python2-setuptools' 'pkg-config')
source=("git://github.com/sumary/pyjavascriptcore.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
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

