# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=sncosmo
pkgname=python2-${_pyname}-doc
pkgver=1.8.2
pkgrel=1
pkgdesc="Documentation for SNCosmo"
arch=('i686' 'x86_64')
url="https://sncosmo.readthedocs.io/"
license=('BSD')
makedepends=("python2-${_pyname}=${pkgver}" 'python2-sphinx_rtd_theme' 'python2-sphinx-gallery' 'python2-iminuit' 'python2-numpydoc')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('3b18d131d1e254b729a978a1a2f0fa38')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make SPHINXBUILD=sphinx-build2 html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
