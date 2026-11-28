# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bacon-ls-bin
pkgver=0.32.0
pkgrel=1
pkgdesc="Rust language server using Bacon diagnostics"
arch=('x86_64' 'aarch64')
url="https://github.com/crisidev/bacon-ls"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/crisidev/bacon-ls/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bacon-ls-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bacon-ls-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('7d74806e0916f695769589c651d23e52ceb7cb99f58e53832cb5e08585ac0d88')
sha256sums_x86_64=('2250c39466a84be4adbc8c249c871cea6f8715e9fb0236aba57ae16134aa7e3d')
sha256sums_aarch64=('e7bb148fb15c831c393a22f7ffdd48ef1b6fa9e4290ba3fce4fd09a91cd3ade5')

package() {
  install -Dm755 "bacon-ls" "${pkgdir}/usr/bin/bacon-ls"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
