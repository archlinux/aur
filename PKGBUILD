# Maintainer: Achmad Fathoni<fathoni(dot)id(at)gmail(dot)com>
pkgname=python-ouster-sdk
_pkgname=${pkgname:7}
pkgver=0.4.0
pkgrel=2
pkgdesc="Ouster sensor SDK"
arch=(any)
url="https://pypi.org/project/ouster-sdk/"
license=('BSD-3-Clause License')
makedepends=('python-setuptools' 'python-pytest' 'pybind11' 'jsoncpp' 'cmake' 'eigen' 'python-wheel')
depends=('python' 'python-typing_extensions' 'libtins')
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('820a3b47423463dc759433849b2aaa3f643a6b55cf2424c3d4666f26e87041a6')

check(){
    cd ${srcdir}/${_pkgname}-${pkgver}
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
