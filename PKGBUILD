# Maintainer: Baptiste Jonglez
# Contributor: Anatol Pomozov 
# Contributor: Reza Jelveh (reza.jelveh@tuhh.de)
# Contributor: Shalygin Konstantin (kostya@opentech.ru)

pkgname=horst
pkgver=5.0
pkgrel=2
pkgdesc='A small, lightweight IEEE802.11 wireless LAN analyzer with a text interface'
arch=("i686" "x86_64")
url='http://br1.einfach.org/tech/horst'
depends=("ncurses" "libnl")
license=("GPL2")
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/br101/horst/archive/version-${pkgver}.tar.gz")
sha256sums=('ea19cc0565b0bc8e001d11d4480030ef8ade67f85b2ddd28f6eb9233cb1e5c5b')

build() {
  cd "${pkgname}-version-${pkgver}"
  make
}

package() {
  cd "${pkgname}-version-${pkgver}"

  install -Dm755 horst "$pkgdir/usr/bin/horst"
  install -Dm644 horst.conf "$pkgdir/etc/horst.conf"
  install -Dm644 horst.1 "$pkgdir/usr/share/man/man1/horst.1"
  install -Dm644 horst.conf.5 "$pkgdir/usr/share/man/man5/horst.conf.5"
}
