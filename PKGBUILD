# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=p2pcopy-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Peer-to-peer file copy without a central server"
arch=('x86_64' 'aarch64')
url="https://github.com/psantosl/p2pcopy"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/p2pcopy-${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/p2pcopy-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('dfb2d7000e3f207defef869b864aa24b5a80cd14b772f647b15d990bf08d482b')
sha256sums_aarch64=('744e58ef3bc32c6cf45efb3ae1b53891c204a76035e085c810e192eec50f7ce2')

package() {
  install -Dm755 "p2pcopy" "${pkgdir}/usr/bin/p2pcopy"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
