# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinx-epytext
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.0.4
pkgrel=1
pkgdesc="Sphinx epytext extension"
arch=('i686' 'x86_64')
url="https://github.com/jayvdb/sphinx-epytext"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-sphinx>=0.4')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('5a7850b097af91ce495a6898fc4cbbe7')

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
