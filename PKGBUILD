# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=stsci.tools
pkgname=python-${_pyname}-doc
pkgver=3.6.0
pkgrel=1
pkgdesc="Documentation for STScI utility functions"
arch=('i686' 'x86_64')
url="https://stscitools.readthedocs.io/"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'python-sphinx')
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
md5sums=('911d86bab531ac2e47a5daa6b4e16062')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
