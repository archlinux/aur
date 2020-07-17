# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=stwcs
pkgname=python-${_pyname}-doc
pkgver=1.6.0
pkgrel=1
pkgdesc="Documentation for STWCS"
arch=('i686' 'x86_64')
url="https://stwcs.readthedocs.io/"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'python-sphinx' 'python-sphinx_rtd_theme' 'texlive-latexextra')
#source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('3493a79b7740518c675983496850dcef')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
