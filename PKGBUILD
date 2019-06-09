# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=iminuit
pkgname=python-${_pyname}-doc
pkgver=1.3.6
pkgrel=1
pkgdesc="Documentation for Python iminuit module"
arch=(any)
url="http://iminuit.readthedocs.io/en/latest/"
license=('GPL' 'MIT')
makedepends=("python-${_pyname}=${pkgver}" 'python-sphinx' 'python-sphinx_rtd_theme' 'python-matplotlib')
source=("https://github.com/iminuit/iminuit/archive/v${pkgver}.tar.gz")
md5sums=('35e595e0155e8edc0fc64d4c1ba7a5de')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mv ${_pyname} _${_pyname}
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
