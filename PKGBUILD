# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-aplpy-doc
pkgver=1.1.1
pkgrel=1
pkgdesc="Documentation for APLpy"
arch=('i686' 'x86_64')
url="http://aplpy.github.io/"
license=('MIT')
makedepends=('python-aplpy' 'python-astropy-helpers>=3.1' 'python-sphinx-astropy')
source=("https://files.pythonhosted.org/packages/source/A/APLpy/APLpy-${pkgver}.tar.gz")
md5sums=('634422c006dcd366d5504af3349e9d10')

prepare() {
    cd ${srcdir}/APLpy-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/APLpy-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/APLpy-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/python-aplpy"
    cp -a html "${pkgdir}/usr/share/doc/python-aplpy"
}
