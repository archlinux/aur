# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=stsci.tools
pkgname=python-${_pyname}-doc
pkgver=4.0.0
pkgrel=1
pkgdesc="Documentation for STScI utility functions"
arch=('i686' 'x86_64')
url="https://stscitools.readthedocs.io"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'python-sphinx')
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
md5sums=('566deb168fd91a1e463a19dbb92b43e2')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/build

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.md
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
