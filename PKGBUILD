# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=einsteinpy
pkgname=python-${_pyname}-doc
pkgver=0.4.0
pkgrel=1
pkgdesc="Documentation for EinsteinPy"
arch=('i686' 'x86_64')
url="https://einsteinpy.org/"
license=('MIT')
makedepends=("python-${_pyname}=${pkgver}" 'python-nbsphinx' 'pandoc' 'graphviz')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('b6de4fa4af7f60b46b5f34b1457e8ed6')

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
