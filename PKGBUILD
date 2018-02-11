# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-pyregion-doc
pkgver=2.0
pkgrel=1
pkgdesc="Documentation for Python pyregion module"
arch=('i686' 'x86_64')
url="http://pyregion.readthedocs.io/en/latest/"
license=('MIT')
makedepends=('python-matplotlib' 'python-astropy' 'python-astropy-helpers' 'python-pyregion' 'python-sphinx')
source=("https://files.pythonhosted.org/packages/source/p/pyregion/pyregion-${pkgver}.tar.gz")
md5sums=('c228b133a1573d2017e0857a9fbf23c5')

prepare() {
    cd ${srcdir}/pyregion-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/pyregion-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/pyregion-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/python-pyregion"
    cp -a html "${pkgdir}/usr/share/doc/python-pyregion"
}
