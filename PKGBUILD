# Maintainer: fubarhouse
pkgname=skpr
provides=(skpr skpr-rsh)
pkgver=0.12.2
pkgrel=5
pkgdesc="The skpr cli tool"
arch=('x86_64')
url="https://github.com/skpr/cli"
license=('MIT')
makedepends=('tar')
source=("skpr_v${pkgver}::${url}/releases/download/v${pkgver}/skpr_${pkgver}_linux_amd64.tar.gz")
sha512sums=('6d0264ad50e4f47bfe4e1edc8f373b69f6817faddc54711c42889ca0725e9e25b2e567229a42ccc3f2bdf499d07f0949c9020e721000af5edb5721c80357e254')

package() {
  cd ${pkgname}_${pkgver}_linux_amd64
  mkdir -p $pkgdir/usr/local/bin
  install -Dm755 ${pkgname} "$pkgdir/usr/local/bin/skpr"
  install -Dm755 ${pkgname}-rsh "$pkgdir/usr/local/bin/${pkgname}-rsh"
}
