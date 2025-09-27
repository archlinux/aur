# Maintainer: Dainis Koknese <gatesby at protonmail dot com>
# Contributor: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>

pkgname=g15daemon
pkgver=3.0.4a
pkgrel=2
pkgdesc="A daemon that makes it possible to use the G-Buttons and draw on the G15 LCD"
arch=('x86_64')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL')
depends=('libg15render>=3.0')
conflicts=('g15daemon-git')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('7b899385cce475e9f50b21bba2d9eb0e1948fdd2d3b2031c1187936e1253a1700d0a7f22f42611b2db5f22bd86ef95efcdd290c87701436bb0974028d2fc1987')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  echo ""
  echo "This package doesn't come with an init, you should install one:"
  echo "g15daemon-runit"
  echo "g15daemon-openrc"
  echo "g15daemon-systemd"
}
