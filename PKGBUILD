# Maintainer: Nils Czernia <nils[at]czserver[dot]de>

pkgname=dnsvi
pkgver=1.4
pkgrel=1
pkgdesc="Edit dynamic DNS zones in vi"
arch=("any")
url="https://github.com/ChristophBerg/dnsvi"
license=("GPL3")
depends=("perl" "bind-tools" "perl-sort-naturally")

source=("https://github.com/ChristophBerg/dnsvi/archive/${pkgver}.tar.gz")
sha512sums=('5987014e2bbbe13fbe38d7cc2dfcfd457686c7820d10e340aedde1d559cd87b70c1d1ee758940ce005aae59d1a76a72be6fcb293f243d09870c3828b2b491540')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make all
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm755 dnsvi ${pkgdir}/usr/bin/dnsvi
  install -Dm644 dnsvi.1 ${pkgdir}/usr/share/man/man1/dnsvi.1
}
