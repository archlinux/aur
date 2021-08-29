# Maintainer: fubarhouse
pkgname=skpr
provides=(skpr skpr-rsh)
pkgver=0.12.0
pkgrel=3
pkgdesc="The skpr cli tool"
arch=('x86_64')
url="https://github.com/skpr/cli"
license=('MIT')
makedepends=('tar')
source=("skpr_v${pkgver}::${url}/releases/download/v${pkgver}/skpr_${pkgver}_linux_amd64.tar.gz")
sha512sums=('cfc40f22b359fa6b799b69e8ffc7504dde30a32aec50d3aa63318eb0fadabefd0d76f77a084d228300e66bc0e023a2e27ca69747bdd366bd1c9476b8b042e773')

package() {
  cd ${pkgname}_${pkgver}_linux_amd64
  mkdir -p $pkgdir/usr/local/bin
  install -Dm755 ${pkgname} "$pkgdir/usr/local/bin/skpr"
  install -Dm755 ${pkgname}-rsh "$pkgdir/usr/local/bin/${pkgname}-rsh"
}
