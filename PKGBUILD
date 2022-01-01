# Maintainer:
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: swiftscythe

_pkgname=nuvolasdk
pkgname=python-${_pkgname}
pkgver=4.24.0
pkgrel=1
pkgdesc="SDK for building Nuvola Player's web app scripts"
arch=(any)
url="https://github.com/tiliado/nuvolasdk"
license=(BSD)
depends=(python-pillow)
makedepends=(python-setuptools)
replaces=(nuvolasdk)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tiliado/nuvolasdk/archive/${pkgver}.tar.gz")
sha256sums=('1a1912f79ec2a7e0a9c96dd42ff5300016d289574bc791b8770f37653b055fbd')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python setup.py install --skip-build --optimize=1 --prefix=/usr --root="${pkgdir}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
