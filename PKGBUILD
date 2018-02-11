# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-ginga-doc
pkgver=2.7.0
pkgrel=1
pkgdesc="Documentation for Ginga"
arch=('i686' 'x86_64')
url="https://ejeschke.github.io/ginga/"
license=('BSD')
makedepends=('python-ginga' 'python-astropy-helpers' 'python-pillow' 'python-sphinx')
source=("https://files.pythonhosted.org/packages/source/g/ginga/ginga-${pkgver}.tar.gz")
md5sums=('9943993e23af3069ada93dcd12f11c87')

prepare() {
    cd ${srcdir}/ginga-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/ginga-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/ginga-${pkgver}/doc/_build

    install -d -m755 "${pkgdir}/usr/share/doc/python-ginga"
    cp -a html "${pkgdir}/usr/share/doc/python-ginga"
}
