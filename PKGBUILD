# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-galpy-doc
pkgver=1.6.0.post0
pkgrel=1
pkgdesc="Documentation for galpy"
arch=('i686' 'x86_64')
url="https://www.galpy.org"
license=('BSD')
makedepends=("python-galpy=${pkgver}" 'python-sphinx' 'python-future' 'gsl')
source=("https://github.com/jobovy/galpy/archive/v${pkgver}.tar.gz")
md5sums=('5ecad599bc324912ae2be8dffe11a357')

build() {
    cd ${srcdir}/galpy-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/galpy-docs

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../galpy-${pkgver}/LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/python-galpy/html"
    cp -a * "${pkgdir}/usr/share/doc/python-galpy/html"
}
