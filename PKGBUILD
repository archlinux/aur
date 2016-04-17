# Maintainer: Brin Bidulock <bidulock@openss7.com>
# Contributor: Chuan Ji <jichuan89[at]gmail[dot]com>
pkgname=gatotray
pkgver=2.3
pkgrel=3
pkgdesc="Graphical CPU stats monitor in the system tray."
url="http://code.google.com/p/gatotray/"
arch=('x86_64' 'i686')
license=('CCPL:by')
depends=('gtk2' 'xterm')
_r="4218cadee76b8a9e9e01bb78de2866cdeafb7a5f"
source=("https://gatotray.googlecode.com/archive/${_r}.tar.gz")
md5sums=('SKIP')

build() {
  cd "${srcdir}/"${pkgname}-*
  make
}

package() {
  cd "${srcdir}/"${pkgname}-*
  strip gatotray
  install -Dm755 gatotray "${pkgdir}/usr/bin/gatotray"
}

# vim:set ts=2 sw=2 et:
