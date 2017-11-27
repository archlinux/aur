# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgbase=python-thrift
pkgname=(python-thrift python2-thrift)
_pkgname=thrift
pkgver=0.10.0
pkgrel=1
pkgdesc='Python bindings for the Apache Thrift RPC system'
arch=(i686 x86_64)
license=(Apache)
url='https://thrift.apache.org/'
makedepends=(python-setuptools python2-setuptools)
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('b7f6c09155321169af03f9fb20dc15a4a0c7481e7c334a5ba8f7f0d864633209')

prepare() {
    cd "$srcdir"
    cp -a thrift-${pkgver} thrift-py2-${pkgver}
}

package_python2-thrift() {
    depends=(python2)

    cd thrift-py2-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
}

package_python-thrift() {
    depends=(python)

    cd thrift-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
