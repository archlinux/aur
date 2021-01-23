# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=taterm
pkgver=12
pkgrel=1
pkgdesc='Terminal emulator for tiling window managers'
arch=('i686' 'x86_64')
url='https://github.com/t-8ch/taterm'
depends=('vte3' 'dbus')
makedepends=('vala')
license=('GPL3')
source=("${pkgname}-${pkgver}::https://github.com/t-8ch/taterm/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/taterm-${pkgver}"
  make
}

package() {
  cd "${srcdir}/taterm-${pkgver}"

  install -d ${pkgdir}/usr/bin/
  install -m 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}

}

sha256sums=('22d606c3129618cb858ea02eab5417e37e83a68763b3023a35893be6813cfea2')
