# Maintainer: artist for Artix Linux

pkgname=batticonplus
pkgver=2.0.1
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
sha256sums=('a235c5fc0359d480b54a240175e5c5c69b0927fd50a848186ca101703e251d7c')
options=('!debug')

build() {
  cd ${pkgname}-${pkgver}
  make WITH_NOTIFY=1 WITH_GTK3=1 WITH_APPINDICATOR=0
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

