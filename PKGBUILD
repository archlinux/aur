# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=einsteinpy-geodesics
pkgname=python-${_pyname/-/_}-doc
pkgver=0.1.0
pkgrel=1
pkgdesc="Documentation for EinsteinPy Geodesics"
arch=('i686' 'x86_64')
url="https://docs.geodesics.einsteinpy.org"
license=('MIT')
makedepends=("python-${_pyname/-/_}=${pkgver}" 'python-sphinx')
#'python-nbsphinx' 'pandoc' 'graphviz')
source=("https://github.com/einsteinpy/einsteinpy-geodesics/archive/v${pkgver}.tar.gz")
md5sums=('5c43ab1cd6ebeef77cf156bd098abe03')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../COPYING
}
