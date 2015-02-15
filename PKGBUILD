# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=taterm
pkgver=11
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

sha256sums=('5483f03678c6383291cef0936bcdda7605361171da69656447a131fb281df1f3')
