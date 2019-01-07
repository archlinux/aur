# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-pytest-xvfb
_pyname=${pkgname#python-}
pkgver=1.2.0
pkgrel=1
pkgdesc="Pytest plugin to run Xvfb for tests"
arch=('i686' 'x86_64')
url="https://github.com/The-Compiler/pytest-xvfb"
license=('MIT')
depends=('python>=3.3' 'python-pytest>=2.8.1' 'python-pyvirtualdisplay>=0.2.1')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('a5e43fe3926c55b03fc12f4f149f059d')

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
