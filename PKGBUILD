# Maintainer: Tess Hoffman <tess@zrhoffman.net>

pkgname=gof5
pkgver=0.1.5
pkgrel=1
pkgdesc="Open Source F5 VPN client"
arch=('x86_64')
depends=('base')
makedepends=('go')
url="https://github.com/kayrus/gof5"
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kayrus/gof5/archive/v${pkgver}.tar.gz")
sha256sums=('33356f098a81b4ffa17eb63b440675a920a8cb0319b5f3285985b58f88973fed')
b2sums=('b56697f13d0e7dc88b81d0fd4d6eb9e4ec99ecdf6b7796a4d2ca0abb9413d434053270fb8a337b1a99fdd4a358235360a0bcb96e6c972d76604f73c8f2c986c7')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/bin/gof5_linux_amd64" -T "${pkgdir}/usr/bin/gof5"
}
