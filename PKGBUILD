# Maintainer: Alfredo Palhares <alfredo at palhares dot me>

# Please contribute to:
# https://github.com/alfredopalhares/arch-pkgbuilds

pkgname=gof5
pkgver=0.0.10
pkgrel=1
pkgdesc="Open Source F5 VPN client"
arch=('x86_64' 'i686')
depends=('base')
makedepends=('go')
optdepends=('')
url="https://github.com/kayrus/gof5"
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kayrus/gof5/archive/v${pkgver}.tar.gz")
sha256sums=('7623a83d16f038023300cc71ff4e2d0483feafbbe3399def852112371fa56c68')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/bin/gof5_linux" -T "${pkgdir}/usr/bin/gof5"
}
