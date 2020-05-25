# Maintainer: Baptiste Jonglez
# Contributor: Anatol Pomozov 
# Contributor: Reza Jelveh (reza.jelveh@tuhh.de)
# Contributor: Shalygin Konstantin (kostya@opentech.ru)

pkgname=horst
pkgver=5.1
pkgrel=2
pkgdesc='A small, lightweight IEEE802.11 wireless LAN analyzer with a text interface'
arch=("x86_64")
url='https://github.com/br101/horst'
depends=("ncurses" "libnl")
license=("GPL2")
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/br101/horst/archive/v${pkgver}.tar.gz")
sha256sums=('74b4cb1143d93c73c3b4bbbe0c36f89a790401bde9e894e94e2a27339ca384d9')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 horst "$pkgdir/usr/bin/horst"
  install -Dm644 horst.conf "$pkgdir/etc/horst.conf"
  install -Dm644 horst.8 "$pkgdir/usr/share/man/man8/horst.8"
  install -Dm644 horst.conf.5 "$pkgdir/usr/share/man/man5/horst.conf.5"
}
