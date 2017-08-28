# Maintainer: xyzzy <628208@gmail.com>

pkgname=flameshot
pkgver=0.4.1
pkgrel=1
pkgdesc="Powerful yet simple to use screenshot software"
arch=('i686' 'x86_64')
url="https://github.com/lupoDharkael/flameshot"
license=('GPL')
depends=('qt5-base')
makedepends=('make')
provides=('flameshot')
source=("https://github.com/lupoDharkael/flameshot/archive/v${pkgver}.tar.gz")
sha256sums=('4900da38b01dc61d434e29ecabc793b067f180a7ef3ede5e5d3789abfa07d659')

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
