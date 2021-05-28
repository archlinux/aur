# Maintainer:
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: swiftscythe

_pkgname=nuvolasdk
pkgname=python-${_pkgname}
pkgver=4.21.0
pkgrel=1
pkgdesc="SDK for building Nuvola Player's web app scripts"
arch=(any)
url="https://github.com/tiliado/nuvolasdk"
license=(BSD)
depends=(python)
source=("$pkgname-$pkgver.tar.gz::https://github.com/tiliado/nuvolasdk/archive/$pkgver.tar.gz")
sha256sums=('602e87d6d6265b0f279e1d82ab6655c3e1cb48b3c9fe4a6d320c3de93a4dea71')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --skip-build --optimize=1 --prefix=/usr --root="${pkgdir}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
