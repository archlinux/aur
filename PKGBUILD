# Maintainer:
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: swiftscythe

_pkgname=nuvolasdk
pkgname=python-${_pkgname}
pkgver=4.23.0
pkgrel=1
pkgdesc="SDK for building Nuvola Player's web app scripts"
arch=(any)
url="https://github.com/tiliado/nuvolasdk"
license=(BSD)
depends=(python-pillow)
makedepends=(python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tiliado/nuvolasdk/archive/${pkgver}.tar.gz")
sha256sums=('697d6206fe2075b8874a0d79d720f6a8b62083fd3d8e871a7ddc724df502625f')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python setup.py install --skip-build --optimize=1 --prefix=/usr --root="${pkgdir}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
