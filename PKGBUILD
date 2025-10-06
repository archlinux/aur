# Maintainer: artist for Artix Linux

pkgname=batticonplus-ayatana
_pkgname=batticonplus
pkgver=2.0.1
pkgrel=1
pkgdesc='Lightweight battery icon for the system tray and notifier, wayland version (based on cbatticon)'
arch=(x86_64)
url='https://github.com/artist4xlibre'
license=(GPL2)
makedepends=(libayatana-appindicator)
depends=(libnotify gtk3)
conflicts=(batticonplus cbatticon)
source=("$_pkgname-v$pkgver.tar.gz::${url}/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
validpgpkeys=('4CF0F66D9CEF47105E22DD0F73580DE2EDDFA6D6')   # artist for Artix Linux
sha256sums=('a1b9e0e72c6c2640bbfadea1ac6fa47351d35a5b9149a7f2dd97e64efc3ed227')
options=('!debug')

build() {
  cd ${_pkgname}-$pkgver
  make WITH_NOTIFY=1 WITH_GTK3=1 WITH_APPINDICATOR=1
}

package() {
  cd ${_pkgname}-$pkgver
  make DESTDIR="${pkgdir}" install
}

