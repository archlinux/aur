# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=stwcs
pkgname=python-${_pyname}-doc
pkgver=1.7.2
pkgrel=1
pkgdesc="Documentation for STWCS"
arch=('any')
url="https://stwcs.readthedocs.io"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'python-sphinx' 'python-sphinx_rtd_theme' 'texlive-latexextra')
#source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('7c9a2236c3313737483f8643843a3cae')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
