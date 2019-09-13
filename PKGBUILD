# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-galpy-doc
pkgver=1.5
pkgrel=1
pkgdesc="Documentation for galpy"
arch=('i686' 'x86_64')
url="http://galpy.readthedocs.io/"
license=('BSD')
makedepends=("python-galpy=${pkgver}" 'python-sphinx' 'python-future' 'gsl')
source=("https://github.com/jobovy/galpy/archive/v${pkgver}.0.tar.gz")
md5sums=('a4dae164cfdfe5fd0a9be0eb6026eda5')

build() {
    cd ${srcdir}/galpy-${pkgver}.0/doc

    make html
}

package() {
    cd ${srcdir}/galpy-docs

    install -d -m755 "${pkgdir}/usr/share/doc/python-galpy/html"
    cp -a * "${pkgdir}/usr/share/doc/python-galpy/html"
}
