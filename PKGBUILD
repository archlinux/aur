# Maintainer: Alfredo Palhares <alfredo at palhares dot me>

# Please contribute to:
# https://github.com/alfredopalhares/arch-pkgbuilds

pkgname=gof5
pkgver=0.1.4
pkgrel=1
pkgdesc="Open Source F5 VPN client"
arch=('x86_64')
depends=('base')
makedepends=('go')
optdepends=('')
url="https://github.com/kayrus/gof5"
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kayrus/gof5/archive/v${pkgver}.tar.gz")
sha256sums=('2a0e8695660b04c7d0def347978e33360be9d54fbcdf26c2cf9e5f4eb83a7d98')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/bin/gof5_linux_amd64" -T "${pkgdir}/usr/bin/gof5"
}
