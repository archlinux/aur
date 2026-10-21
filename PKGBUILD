# Maintainer: sfs <sfslinux@gmail.com>

pkgname=batticonplus-ayatana-gtk3-git
pkgver=2.0.1
pkgrel=3
pkgdesc="Lightweight battery status icon for the tray with Ayatana Indicators support (Resurrection Mirror)"
arch=('x86_64')
url="https://github.com/sfs-pra/batticonplus"
license=('GPL-2.0-only')
depends=('gtk3' 'libnotify' 'libayatana-indicator')
provides=('batticonplus' 'batticonplus-ayatana' 'batticonplus-git')
conflicts=('batticonplus' 'batticonplus-ayatana' 'batticonplus-git')
makedepends=('git')
source=("git+${url}.git#branch=main")
sha256sums=('SKIP')

build() {
  cd "batticonplus"
  make WITH_GTK3=1 WITH_NOTIFY=1 WITH_APPINDICATOR=1
}

package() {
  cd "batticonplus"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
