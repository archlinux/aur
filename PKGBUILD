# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-iminuit-doc
pkgver=1.3
pkgrel=1
pkgdesc="Documentation for Python iminuit module"
arch=(any)
url="http://iminuit.readthedocs.io/en/latest/"
license=('GPL' 'MIT')
makedepends=('python-iminuit' 'python-sphinx' 'python-matplotlib')
source=("https://github.com/iminuit/iminuit/archive/v${pkgver}.tar.gz")
md5sums=('1f9bd3e2131768e5b5f4aa192d6ab79f')

prepare() {
    cd ${srcdir}/iminuit-${pkgver}

    mv iminuit _iminuit
}

build() {
    cd ${srcdir}/iminuit-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/iminuit-${pkgver}/doc/_build

    install -d -m755 "${pkgdir}/usr/share/doc/python-iminuit"
    cp -a html "${pkgdir}/usr/share/doc/python-iminuit"
}
