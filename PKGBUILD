# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=aptik-battery-monitor
pkgver=17.12
pkgrel=2
pkgdesc='Battery monitor for laptops. Displays detailed statistics for battery life, remaining capacity, and charge/discharge rate'
arch=('x86_64')
url='https://github.com/teejee2008/battery-monitor'
license=('GPL3')
install="${pkgname}.install"
options=('!emptydirs')
depends=('libgee' 'gtk3' 'start-stop-daemon')
makedepends=('vala' 'libgee')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/teejee2008/battery-monitor/archive/v${pkgver}.tar.gz")
sha256sums=('93205480718b8ef6da4aba8169203ecf77055c6d018f520f01c6309630133d8e')

build() {
  cd "battery-monitor-${pkgver}"
  make
}

package() {
  cd "battery-monitor-${pkgver}"
  make DESTDIR="${pkgdir}" install
}