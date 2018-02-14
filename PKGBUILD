# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-pytest-openfiles
pkgver=0.2.0
pkgrel=1
pkgdesc="Pytest plugin for detecting file handles that were inadvertently left open at the end of unit tests"
arch=('i686' 'x86_64')
url="https://github.com/astropy/pytest-openfiles"
license=('BSD')
depends=('python' 'python-pytest' 'python-psutil' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pytest-openfiles/pytest-openfiles-${pkgver}.tar.gz")
md5sums=('67be17f8a5eec42a23ed2c0cb1cc3894')

package() {
    cd ${srcdir}/pytest-openfiles-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    rm -rf ${pkgdir}/usr/lib/python3.6/site-packages/tests
}
