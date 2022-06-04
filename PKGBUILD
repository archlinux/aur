# Maintainer: Tony Lambiris <tony@libpcap.net>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Sébastien "Seblu" Luttringer

pkgname=python2-msgpack
pkgver=1.0.4
pkgrel=2
pkgdesc='MessagePack serializer implementation for Python'
url='https://github.com/msgpack/msgpack-python'
arch=('x86_64')
license=('Apache')
depends=('python2')
makedepends=('cython2' 'python2-setuptools')
#checkdepends=('python2-pytest' 'python2-six')
source=(msgpack-python-$pkgver.tar.gz::https://github.com/msgpack/msgpack-python/archive/v$pkgver.tar.gz)
sha256sums=('4fd3e3e99c652e8ef435940a7f59ae751f3c5f4ef89fa5aa1b951e7cc80c1972')

build() {
    cd "${srcdir}/msgpack-python-${pkgver}"

    python2 setup.py build --build-lib=build/python
}

#check() {
#    cd "${srcdir}/msgpack-python-${pkgver}"
#
#    env PYTHONPATH="$PWD/build/python" py.test2 test
#}

package() {
    cd "${srcdir}/msgpack-python-${pkgver}"

    python2 setup.py build --build-lib=build/python \
        install --root="${pkgdir}" --optimize=1
}
