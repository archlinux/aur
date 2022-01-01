# Maintainer:
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Laramy Black <laramy2020@gmail.com>

_nuvola=bbc-iplayer
pkgname=nuvola-app-${_nuvola}
pkgver=1.7
pkgrel=1
pkgdesc="BBC iPlayer integration for Nuvola Player"
arch=(any)
url="https://github.com/tiliado/nuvola-app-${_nuvola}"
license=(BSD)
depends=(nuvolaruntime)
makedepends=(python-nuvolasdk scour)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tiliado/nuvola-app-${_nuvola}/archive/${pkgver}.tar.gz")
sha256sums=('fb32275b51bb394eed2f18f95d7e02d4e03a945bfba52039fb8fdd41d9682183')

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
