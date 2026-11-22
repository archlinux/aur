# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ilmari-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="A tmux popup dashboard for monitoring AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/bnomei/ilmari"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/bnomei/ilmari/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ilmari-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ilmari-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('077d138387dd107179fec3cefab95ced64f27c20845d014488fc542c4093c962')
sha256sums_x86_64=('dd70295018fbf9078b06337e0dac27a8d244f86841cc5a98607b01059ef444dd')
sha256sums_aarch64=('b0bb47b4bad999e227ae57fe4e5467acf88183d8dc5b41de2a609c8f22250866')

package() {
  install -Dm755 "ilmari" "${pkgdir}/usr/bin/ilmari"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
