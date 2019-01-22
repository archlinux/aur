# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=glue-core
pkgname=glueviz-doc
pkgver=0.14.1
pkgrel=1
pkgdesc="Documentation for Glue"
arch=('i686' 'x86_64')
url="http://glueviz.org/"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'glueviz' 'python-bottleneck' 'python-sphinx-automodapi' 'python-numpydoc')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('57ea8e91d8fb6ee2c06294564ef9433c')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
