# Maintainer: fubarhouse
pkgname=skpr
provides=(skpr skpr-rsh)
pkgver=0.11.5
pkgrel=2
pkgdesc="The skpr cli tool"
arch=('x86_64')
url="https://github.com/skpr/cli"
license=('MIT')
makedepends=('tar')
source=("skpr_v${pkgver}::${url}/releases/download/v${pkgver}/skpr_${pkgver}_linux_amd64.tar.gz")
sha512sums=('0d40eae79f7a0570f45b83a04b4f6e25759123d1edbb0ac77050e6fd8400589eea56b8ad31f560f23ae3ce419145c09d450006dffe2aef7a75fafdc9b3f7a73e')

package() {
  cd ${pkgname}_${pkgver}_linux_amd64
  mkdir -p $pkgdir/usr/local/bin
  install -Dm755 ${pkgname} "$pkgdir/usr/local/bin/skpr"
  install -Dm755 ${pkgname}-rsh "$pkgdir/usr/local/bin/${pkgname}-rsh"
}
