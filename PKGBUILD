# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=naima
pkgname=python-${_pyname}-doc
pkgver=0.9.0
pkgrel=1
pkgdesc="Documentation for Python Naima module"
arch=('i686' 'x86_64')
url="http://naima.readthedocs.io"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'python-sphinx-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('7c50e8576273a3004de45961b70e9e51')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
}
