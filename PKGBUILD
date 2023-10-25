# Maintainer: fubarhouse
pkgname=skpr
provides=("skpr-rsh")
pkgver=0.24.0
pkgrel=14
pkgdesc="CLI tool for managing web applications on the platform."
arch=('x86_64')
url="https://github.com/skpr/cli"
license=('MIT')
source=("skpr_v${pkgver}::${url}/releases/download/v${pkgver}/skpr_${pkgver}_linux_amd64.tar.gz")
sha512sums=('1813ca38b9f38a5cc0792a4817e67a5f217c40bca6da95ea0085c3f7db2856139241b6a8f3ef1c44c712d2bb81ba327b94bd2b30db110ae9c3ebdfde1254ae53')

package() {
  cd ${pkgname}_${pkgver}_linux_amd64
  mkdir -p $pkgdir/usr/bin
  install -Dm755 ${pkgname} "$pkgdir/usr/bin/skpr"
  install -Dm755 ${pkgname}-rsh "$pkgdir/usr/bin/${pkgname}-rsh"
}
