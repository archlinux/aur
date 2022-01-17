# Maintainer: fubarhouse
pkgname=skpr
provides=(skpr skpr-rsh)
pkgver=0.15.0
pkgrel=12
pkgdesc="The skpr cli tool"
arch=('x86_64')
url="https://github.com/skpr/cli"
license=('MIT')
makedepends=('tar')
source=("skpr_v${pkgver}::${url}/releases/download/v${pkgver}/skpr_${pkgver}_linux_amd64.tar.gz")
sha512sums=('a9f62ffae1893e41be4dd9cacf1461dec3108836aac5e33df4e88a3c7b7cfab804e420920351d45eb447390ec227105e7b29b1e6c549c676532058f2b29c3125')

package() {
  cd ${pkgname}_${pkgver}_linux_amd64
  mkdir -p $pkgdir/usr/local/bin
  install -Dm755 ${pkgname} "$pkgdir/usr/local/bin/skpr"
  install -Dm755 ${pkgname}-rsh "$pkgdir/usr/local/bin/${pkgname}-rsh"
}
