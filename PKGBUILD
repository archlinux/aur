# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Jed Liu <jed-archlinux.org@uma.litech.org>

pkgbase=python-thrift
pkgname=(python-thrift python2-thrift)
_pkgname=thrift
pkgver=0.13.0
pkgrel=1
pkgdesc='Python bindings for the Apache Thrift RPC system'
arch=(i686 x86_64)
license=(Apache)
url='https://thrift.apache.org/'
makedepends=(python-setuptools python2-setuptools)
source=(thrift-$pkgver.zip::https://github.com/apache/$_pkgname/archive/$pkgver.zip)
sha256sums=('4ed6254847b9c632fb64e5ba700a4cefa441af2b53bfc6ff91206fe5771be74f')

prepare() {
    cd "$srcdir"
    cp -a thrift-${pkgver} thrift-py2-${pkgver}
}

package_python2-thrift() {
    depends=(python2)

    cd thrift-py2-$pkgver/lib/py
    python2 setup.py install --root="$pkgdir" --optimize=1
}

package_python-thrift() {
    depends=(python)

    cd thrift-$pkgver/lib/py
    python setup.py install --root="$pkgdir" --optimize=1
}
