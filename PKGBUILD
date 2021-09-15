# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=stsci.stimage
pkgname=python-${_pyname}-doc
pkgver=0.2.5
pkgrel=1
pkgdesc="Documentation for STScI Image"
arch=('i686' 'x86_64')
url="https://stscistimage.readthedocs.io"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'python-sphinx-automodapi' 'python-sphinx_rtd_theme')
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
md5sums=('52bd531b7bf762f11a814ad209bcd80d')

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
