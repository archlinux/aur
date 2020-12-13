# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: xduugu <xduugu@gmx.com>

pkgname=faba-icon-theme
pkgver=4.3
pkgrel=2
pkgdesc="Faba is a sexy and modern icon theme with Tango influences"
arch=('any')
url='https://snwh.org/moka'
license=('LGPL3' 'CCPL')
depends=('gtk-update-icon-cache')
makedepends=('meson')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/snwh/faba-icon-theme/archive/v${pkgver}.tar.gz")
sha256sums=('c87ce7dae8df6b25228297baa1be96cfad06c5c109ff60fedf1f0343bb0196a2')

build() {
  meson --prefix /usr --buildtype plain "${pkgname}-${pkgver}" build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
