# Maintainer: xyzzy <628208@gmail.com>

pkgname=flameshot
pkgver=0.3.0
pkgrel=1
pkgdesc="Powerful yet simple to use screenshot software"
arch=('i686' 'x86_64')
url="https://github.com/lupoDharkael/flameshot"
license=('GPL')
depends=('qt5-base')
makedepends=('make')
provides=('flameshot')
source=("https://github.com/lupoDharkael/flameshot/archive/v${pkgver}.tar.gz")
sha256sums=('c134550b7592a5f2b87e32f05081da48d5ef4e6243d82f24697ebd528fa823d6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "./flameshot" "${pkgdir}/usr/bin/flameshot"
  install -Dm644 "./dbus/package/org.dharkael.Flameshot.service" "${pkgdir}/usr/share/dbus-1/services/org.dharkael.Flameshot.service"
  install -Dm644 "./dbus/org.dharkael.Flameshot.xml" "${pkgdir}/usr/share/dbus-1/interfaces/org.dharkael.Flameshot.xml"
  install -Dm644 "./docs/desktopEntry/package/flameshot.desktop" "${pkgdir}/usr/share/applications/flameshot.desktop"
  install -Dm644 "./docs/desktopEntry/package/flameshot-init.desktop" "${pkgdir}/usr/share/applications/flameshot-init.desktop"
  install -Dm644 "./img/flameshot.png" "${pkgdir}/usr/share/icons/flameshot.png"
}
