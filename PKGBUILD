# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=einsteinpy
pkgname=python-${_pyname}-doc
pkgver=0.2.1
pkgrel=1
pkgdesc="Documentation for EinsteinPy"
arch=('i686' 'x86_64')
url="https://einsteinpy.org/"
license=('MIT')
makedepends=("python-${_pyname}=${pkgver}" 'python-nbsphinx' 'python-numba' 'pandoc' 'graphviz')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('24f0ba1b00781fc3bd2cf8fa082e22ca')

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
