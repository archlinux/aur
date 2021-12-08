# Maintainer: fubarhouse
pkgname=skpr
provides=(skpr skpr-rsh)
pkgver=0.14.3
pkgrel=9
pkgdesc="The skpr cli tool"
arch=('x86_64')
url="https://github.com/skpr/cli"
license=('MIT')
makedepends=('tar')
source=("skpr_v${pkgver}::${url}/releases/download/v${pkgver}/skpr_${pkgver}_linux_amd64.tar.gz")
sha512sums=('81791ac78cf42e43d2c165c4c5c7f2366b7ca94036e33c426500d1edef930670cc2c372683262042f7897f568959ae3f291488983c774f0da460cfd82bd5a96b')

package() {
  cd ${pkgname}_${pkgver}_linux_amd64
  mkdir -p $pkgdir/usr/local/bin
  install -Dm755 ${pkgname} "$pkgdir/usr/local/bin/skpr"
  install -Dm755 ${pkgname}-rsh "$pkgdir/usr/local/bin/${pkgname}-rsh"
}
