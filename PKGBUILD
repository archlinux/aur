# Maintainer: Alfredo Palhares <alfredo at palhares dot me>

# Please contribute to:
# https://github.com/alfredopalhares/arch-pkgbuilds

pkgname=gof5
pkgver=0.1.3
pkgrel=1
pkgdesc="Open Source F5 VPN client"
arch=('x86_64')
depends=('base')
makedepends=('go')
optdepends=('')
url="https://github.com/kayrus/gof5"
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kayrus/gof5/archive/v${pkgver}.tar.gz")
sha256sums=('a89191a4d33fb0b89baf658639708cc47f1d1c2b39e0febec1ac333e0eee4318')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/bin/gof5_linux_amd64" -T "${pkgdir}/usr/bin/gof5"
}
