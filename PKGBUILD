# Maintainer: fubarhouse
pkgname=skpr
provides=("skpr-rsh")
pkgver=0.19.2
pkgrel=13
pkgdesc="CLI tool for managing web applications on the platform."
arch=('x86_64')
url="https://github.com/skpr/cli"
license=('MIT')
source=("skpr_v${pkgver}::${url}/releases/download/v${pkgver}/skpr_${pkgver}_linux_amd64.tar.gz")
sha512sums=('f3023d92dae052ef08cb247705af80498332f7414ba3858a32849065b96076cc3b6c4d3542acf9ac54c4fe36c2eae5f741503378b28aceeaa2a773826cab9416')

package() {
  cd ${pkgname}_${pkgver}_linux_amd64
  mkdir -p $pkgdir/usr/bin
  install -Dm755 ${pkgname} "$pkgdir/usr/bin/skpr"
  install -Dm755 ${pkgname}-rsh "$pkgdir/usr/bin/${pkgname}-rsh"
}
