# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sqlfuzz-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Simple SQL table fuzzing"
arch=('x86_64' 'aarch64')
url="https://github.com/PumpkinSeed/sqlfuzz"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/PumpkinSeed/sqlfuzz/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/sqlfuzz_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/sqlfuzz_linux_arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('83ae4a264a21e1f7cfff5f79a9a8ceed58fdd67743ac3c921632e00b84641aa8')
sha256sums_aarch64=('6121c5cde214a60216c86a6b74cc946824b4a2130b291b32041108e168b56cd4')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/sqlfuzz"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
