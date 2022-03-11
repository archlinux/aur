# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=aplpy
pkgname=python-aplpy-doc
pkgver=2.1.0
pkgrel=1
pkgdesc="Documentation for APLpy"
arch=('any')
url="http://aplpy.github.io"
license=('MIT')
makedepends=("python-aplpy=${pkgver}" 'python-sphinx-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('385c32e8565cae6abf549509a4243e50')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.md
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
