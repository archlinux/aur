# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python2-d2to1
_pyname=${pkgname#python2-}
pkgver=0.2.12.post1
pkgrel=5
pkgdesc="Modeling and fitting package for scientific data analysis"
arch=('i686' 'x86_64')
url="https://github.com/embray/d2to1"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('1ba7e64ead23cbf104993122f0871030')

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
