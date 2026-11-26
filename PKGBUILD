# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=homebutler-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="Tells you what changed on your server, only what is worth telling"
arch=('x86_64' 'aarch64')
url="https://github.com/Higangssh/homebutler"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/homebutler_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/homebutler_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b3772ab9374538453c9955ebb53f29fdd85810d55d20f4a1f466f4ad3be54d19')
sha256sums_aarch64=('4503738e1d2a7010ed634a48a7ca7f5323c4a033417c2be093dd65240b6e330a')

package() {
  install -Dm755 "homebutler" "${pkgdir}/usr/bin/homebutler"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
