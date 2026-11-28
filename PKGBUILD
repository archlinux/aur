# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sysl-bin
pkgver=0.792.0
pkgrel=1
pkgdesc="System specification language"
arch=('x86_64' 'aarch64')
url="https://github.com/anz-bank/sysl"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sysl_${pkgver}_linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sysl_${pkgver}_linux-arm64.tar.gz")
sha256sums_x86_64=('2fac2dfa62b66ec12b930d253ca0ab9e265e2c852dc8d7b08404207b89b8fa92')
sha256sums_aarch64=('ba91ae304bfcff50c039a29b0d2723f2af7f2970fe5b1df0f41b4a271d8d0658')

package() {
  install -Dm755 "sysl" "${pkgdir}/usr/bin/sysl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
