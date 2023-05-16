# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-networkmanager
_pypi_pkgname=python-networkmanager
pkgver=2.2
pkgrel=2
pkgdesc="Easy communication with NetworkManager"
arch=(any)
url="https://github.com/seveas/python-networkmanager"
license=('zlib')
makedepends=('python-setuptools')
depends=('python' 'networkmanager')
source=("https://pypi.io/packages/source/p/python-networkmanager/python-networkmanager-${pkgver}.tar.gz")
sha256sums=('de6eb921d94aba7549f428ed2b3aa482a5d543ecb6965cbaa0fbb555ab31b9d5')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
