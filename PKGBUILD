# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=stsci.imagestats
pkgname=python-${_pyname}-doc
pkgver=1.8.2
pkgrel=1
pkgdesc="Documentation for STScI Imagestats"
arch=('any')
url="https://stsciimagestats.readthedocs.io"
license=('BSD-3-Clause')
makedepends=("python-${_pyname}=${pkgver}" 'python-numpydoc' 'python-sphinx_rtd_theme')
# 'python-stsci_rtd_theme')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('2c4858cf1f35515e376bb49006e11510')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
