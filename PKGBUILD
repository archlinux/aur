# Maintainer:
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Laramy Black <laramy2020@gmail.com>

_nuvola=jupiter-broadcasting
pkgname=nuvola-app-${_nuvola}
pkgver=1.6
pkgrel=1
pkgdesc=" integration for Nuvola Player"
arch=(any)
url="https://github.com/tiliado/nuvola-app-${_nuvola}"
license=(BSD)
depends=(nuvolaruntime)
makedepends=(python-nuvolasdk scour)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tiliado/nuvola-app-${_nuvola}/archive/${pkgver}.tar.gz")
sha256sums=('f825cbb4d5aaca2429adff0bd9806341be0b522ad8263bd715f103d6df44b83c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
