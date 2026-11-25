# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=duckle-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Open-source ETL/ELT platform for your own servers or cloud"
arch=('x86_64' 'aarch64')
url="https://github.com/slothflowlabs/duckle"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/slothflowlabs/duckle/v${pkgver}/LICENSE-APACHE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/duckle-runner-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/Duckle-linux-arm64")
sha256sums=('1e7e1bc923e0f439d5aefb15b19be5082079f2929f86da51ae1339d1db5bce2b')
sha256sums_x86_64=('cf024deb51a16c53a82ecbd5913f77d68d64af8f380a2fe0cefb55f1756888b1')
sha256sums_aarch64=('cfca4a4e55e837a5d185e7628c3c5bf4a752047f589995edbfe26378922ed81e')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/duckle-runner"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
