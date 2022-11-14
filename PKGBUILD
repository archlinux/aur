# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-galpy-doc
pkgver=1.8.1
pkgrel=1
pkgdesc="Documentation for galpy"
arch=('any')
url="https://www.galpy.org"
license=('BSD')
makedepends=("python-galpy=${pkgver}" 'python-sphinx' 'gsl')
source=("https://github.com/jobovy/galpy/archive/v${pkgver}.tar.gz")
md5sums=('020d28f8b6dd1c488ea47abac8d685c1')

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
