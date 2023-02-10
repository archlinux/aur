# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=pyregion
pkgname=python-${_pyname}-doc
pkgver=2.2.0
pkgrel=1
pkgdesc="Documentation for Python pyregion module"
arch=('any')
url="http://pyregion.readthedocs.io"
license=('MIT')
makedepends=("python-${_pyname}=${pkgver}"
             'python-sphinx-automodapi'
             'python-sphinx_rtd_theme'
             'python-matplotlib')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('54f9c062409892a95cd4fee46a6105bb')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
}
