# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-pytest-socket
_pyname=${pkgname#python-}
pkgver=0.3.4
pkgrel=1
pkgdesc="Pytest Plugin to disable socket calls during tests"
arch=('any')
url="https://github.com/miketheman/pytest-socket"
license=('MIT')
depends=('python>=3.6.3' 'python-pytest')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('4de333f221846cb92414cdeef76ed40f')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
