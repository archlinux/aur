# Maintainer: Nils Czernia <nils[at]czserver[dot]de>

pkgname=dnsvi
pkgver=1.3
pkgrel=1
pkgdesc="Edit dynamic DNS zones in vi"
arch=("any")
url="https://github.com/ChristophBerg/dnsvi"
license=("GPL3")
depends=("perl" "bind-tools")

source=("https://github.com/ChristophBerg/dnsvi/archive/${pkgver}.tar.gz")
sha512sums=("931e25527ceb7d4e4ddebb56f3dfdfe9dfaeb0e7c308817bff212f69157f32c66a853c250d89176a8cc3135a2770c284ccfa372403daf59821fefd85cbd4809d")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make all
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm755 dnsvi ${pkgdir}/usr/bin/dnsvi
  install -Dm644 dnsvi.1 ${pkgdir}/usr/share/man/man1/dnsvi.1
}
