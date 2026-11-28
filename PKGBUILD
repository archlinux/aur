# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mobius-bin
pkgver=0.24
pkgrel=1
pkgdesc="Hotline server"
arch=('x86_64' 'aarch64')
url="https://github.com/jhalter/mobius"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mobius_server_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mobius_server_Linux_arm64.tar.gz")
sha256sums_x86_64=('873ca1203a318e416c1bfc9dfb13f0ff1af1359eaeb30fe60b4f9a84b46517a7')
sha256sums_aarch64=('403665dd2cec195c91e434c73b654fe1ba773f59e98b7a78455979c38d6456e5')

package() {
  install -Dm755 "mobius-hotline-server" "${pkgdir}/usr/bin/mobius-hotline-server"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
