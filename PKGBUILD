# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pigeon-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Generate Go parsers from PEG grammars"
arch=('x86_64' 'aarch64')
url="https://github.com/mna/pigeon"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pigeon_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pigeon_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('72fb906eb887b59efa26f778c320c1f132db33056c00fdde1c11e9230d01ef19')
sha256sums_aarch64=('2b44eeffafe85782e923023479f0f2c640586250e7f2c7b7777516f8c548f7c3')

package() {
  install -Dm755 "pigeon" "${pkgdir}/usr/bin/pigeon"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
