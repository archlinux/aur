# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=stsci.imagestats
pkgname=python-${_pyname}-doc
pkgver=1.6.2
pkgrel=1
pkgdesc="Documentation for STScI Imagestats"
arch=('i686' 'x86_64')
url="https://stsciimagestats.readthedocs.io/"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'python-numpydoc' 'python-sphinx_rtd_theme' 'python-stsci_rtd_theme')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('54fde240cb959755efee0b9f0c8e9450')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mv stsci _stsci
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
