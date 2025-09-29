# Maintainer: artist for Artix Linux

pkgname=batticonplus
pkgver=2.0.0
pkgrel=1
pkgdesc='Lightweight battery icon for the system tray and notifier (based on cbatticon)'
arch=(x86_64)
url='https://github.com/artist4xlibre'
license=(GPL2)
depends=(libnotify gtk3)
conflicts=(batticonplus-ayatana cbatticon)
replaces=(cbatticon)
source=("$pkgname-v$pkgver.tar.gz::${url}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
validpgpkeys=('4CF0F66D9CEF47105E22DD0F73580DE2EDDFA6D6')   # artist for Artix Linux
sha256sums=('a1b9e0e72c6c2640bbfadea1ac6fa47351d35a5b9149a7f2dd97e64efc3ed227')

build() {
  cd ${pkgname}
  make WITH_NOTIFY=1 WITH_GTK3=1 WITH_APPINDICATOR=0
}

package_batticonplus() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}

