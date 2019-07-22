# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-novas_de405
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}")
pkgver=1997.1
pkgrel=1
pkgdesc="JPL DE405 ephemeris needed by the NOVAS package"
arch=('i686' 'x86_64')
url="https://github.com/brandon-rhodes/python-novas"
license=('custom')
#checkdepends=('python-pytest' 'python2-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('86341c564b5b97ca8693f1b25135efd8')

prepare() {
    cp -a ${srcdir}/${_pyname}-${pkgver}{,-py2}
}

package_python2-novas_de405() {
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-novas_de405() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
