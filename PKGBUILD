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
sha256sums=('2da56e84f42763d1ca8502156f1de347c1e16467f14a7e809b7ccafe8d428a96')

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
