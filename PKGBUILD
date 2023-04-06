# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-txrequests
pkgver=0.9.6
pkgrel=9
pkgdesc='Asynchronous Python HTTP Requests for Humans using twisted'
license=('Apache')
arch=(any)
url='https://github.com/tardyp/txrequests'
depends=(python-requests python-twisted)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/t/txrequests/txrequests-${pkgver}.tar.gz")
sha256sums=('b452a1cafa4d005678f6fa47922a330feb4907d5b4732d1841ca98e89f1362e1')

build() {
    cd txrequests-$pkgver
    python setup.py build
}

check() {
    cd txrequests-$pkgver
    python test_txrequests.py
}

package() {
    cd txrequests-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
