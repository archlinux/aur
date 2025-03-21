# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=stsci.stimage
pkgname=python-${_pyname}-doc
pkgver=0.3.0
pkgrel=1
pkgdesc="Documentation for STScI Image"
arch=('any')
url="https://stscistimage.readthedocs.io"
license=('BSD-3-Clause')
makedepends=("python-${_pyname}=${pkgver}" 'python-sphinx-automodapi' 'python-sphinx_rtd_theme')
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
md5sums=('291003348bb24afc8cc2685c730ba629')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
