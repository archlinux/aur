# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=reminduck
pkgver=1.5.6
pkgrel=1
pkgdesc='A simple reminder app made for elementaryOS with Vala and GTK'
arch=('i686' 'x86_64')
url='https://github.com/matfantinel/reminduck'
license=('GPL3')
depends=('granite')
makedepends=('ninja'
						 'libgee'
						 'granite'
						 'meson'
						 'vala')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/matfantinel/reminduck/archive/v${pkgver}.tar.gz")
sha256sums=('415863efa03427a25b5dccc42018b6f2318a6ba764ada2c0df9741bc8a088145')

build() {
  cd "${pkgname}-${pkgver}"
  meson . build --prefix=/usr
  ninja -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
# vim:set ts=2 sw=2 et:
