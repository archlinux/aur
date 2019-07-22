# Maintainer: Anty0 <anty150 at gmail dot com>

pkgname='python-zulip-api'
pkgver='0.6.1'
pkgrel=1
pkgdesc="Pyhton bindings for Zulip API."
url="https://github.com/zulip/python-zulip-api"
depends=('python'
    'python-requests'
    'python-six'
    'python-matrix-client-git')
makedepends=('cython' 'python-setuptools')
license=('GPL')
arch=('x86_64')
source=("https://github.com/zulip/python-zulip-api/archive/${pkgver}.tar.gz")
sha256sums=('b1046974af1d4c685078bfef766e2ee81c709dcf87a01877760650a0076d3e81')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/zulip"
    python setup.py build_ext --inplace
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/zulip"
    python setup.py install --root="${pkgdir}"
}
