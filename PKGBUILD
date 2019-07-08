# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-galpy-doc
pkgver=1.4.1
pkgrel=1
pkgdesc="Documentation for galpy"
arch=('i686' 'x86_64')
url="http://galpy.readthedocs.io/"
license=('BSD')
makedepends=("python-galpy=${pkgver}" 'python-sphinx')
source=("https://github.com/jobovy/galpy/archive/v${pkgver}.tar.gz")
md5sums=('e752b8db3dc7c3d1e605317a67de12f2')

build() {
    cd ${srcdir}/galpy-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/galpy-docs

    install -d -m755 "${pkgdir}/usr/share/doc/python-galpy/html"
    cp -a * "${pkgdir}/usr/share/doc/python-galpy/html"
}
