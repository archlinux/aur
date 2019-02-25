# Maintainer: Nils Czernia <nils[at]czserver[dot]de>

pkgname=dnsvi
pkgver=1.2
pkgrel=1
pkgdesc="Edit dynamic DNS zones in vi"
arch=("any")
url="https://github.com/ChristophBerg/dnsvi"
license=("GPL3")
depends=("perl" "bind-tools")

source=("https://github.com/ChristophBerg/dnsvi/archive/${pkgver}.tar.gz")
sha512sums=("7f65e8870c50a52f3494cd1fdd70dd839c63708e04980ccd0ee1b18e74e38255b4d86d06b89ab548875eaf0c44685a5fa758fa70c0a27fba7eb98dc4c3ebc81d")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make all
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm755 dnsvi ${pkgdir}/usr/bin/dnsvi
  install -Dm644 dnsvi.1 ${pkgdir}/usr/share/man/man1/dnsvi.1
}
