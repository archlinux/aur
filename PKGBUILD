#Maintainer: Ponies <marmabelle at gmail dot com>
pkgname=postman-cli
pkgver=1.73.0
pkgrel=1
pkgdesc="The Postman CLI is the command-line companion that is developed, supported, and signed by Postman. All test results will be automatically pushed to the app."
provides=('postman-cli')
arch=('x86_64')
options=("!strip")
url="https://www.postman.com/product/what-is-postman/"
license=('custom')
source=("postman-cli.tar.gz::https://dl-cli.pstmn.io/download/latest/linux64")
depends=(libxss nss)

sha256sums=('8f95dfcfc113a7af796783f88e19de26cc7606c9438b414e8cc485199b205817')
prepare() {
  cd "$srcdir"
  tar -xzf postman-cli.tar.gz
}
package() {
  install -dm755 "$pkgdir/usr/bin/"
  cp "${srcdir}/postman-cli" "${pkgdir}/usr/bin/"
}
