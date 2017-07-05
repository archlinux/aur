# Maintainer: xyzzy <628208@gmail.com>

pkgname=flameshot
pkgver=0.2.1
pkgrel=3
pkgdesc="Powerful yet simple to use screenshot software"
arch=('i686' 'x86_64')
url="https://github.com/lupoDharkael/flameshot"
license=('GPL')
depends=('qt5-base')
makedepends=('make')
provides=('flameshot')
source=("https://github.com/lupoDharkael/flameshot/archive/v${pkgver}.tar.gz")
sha256sums=('376cb8f4ecc548f0514d7b01e8584bffa53a40c09d7052f430b5442173ee4189')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "./flameshot" "${pkgdir}/usr/bin/flameshot"
  install -Dm644 "./dbus/org.dharkael.Flameshot.service" "${pkgdir}/usr/share/dbus-1/services/org.dharkael.Flameshot.service"
  install -Dm644 "./dbus/org.dharkael.Flameshot.xml" "${pkgdir}/usr/share/dbus-1/interfaces/org.dharkael.Flameshot.xml"
  install -Dm644 "./docs/desktopEntry/package/flameshot.desktop" "${pkgdir}/usr/share/applications/flameshot.desktop"
  install -Dm644 "./img/flameshot.png" "${pkgdir}/usr/share/icons/flameshot.png"
}
