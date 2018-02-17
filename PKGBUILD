# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-iminuit-doc
pkgver=1.2
pkgrel=1
pkgdesc="Documentation for Python iminuit module"
arch=(any)
url="http://iminuit.readthedocs.io/en/latest/"
license=('GPL' 'MIT')
makedepends=('python-iminuit' 'python-sphinx' 'python-matplotlib')
source=("https://files.pythonhosted.org/packages/source/i/iminuit/iminuit-${pkgver}.tar.gz")
md5sums=('4701ec472cae42015e26251703e6e984')

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
