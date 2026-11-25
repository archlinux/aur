# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=jazzer-bin
pkgver=0.30.0
pkgrel=1
pkgdesc="Coverage-guided, in-process fuzzing for the JVM"
arch=('x86_64' 'aarch64')
url="https://github.com/CodeIntelligenceTesting/jazzer"
license=('Apache-2.0')
depends=('glibc' 'java-runtime')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/CodeIntelligenceTesting/jazzer/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/jazzer-linux-x86-64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/jazzer-linux-arm64.tar.gz")
sha256sums=('b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1')
sha256sums_x86_64=('6eeaf0026d75599b07527d93b576593ce847cfca8b337a579971a5a9cdf792d0')
sha256sums_aarch64=('16636a4d3e98f1d3a7fcf59d4ab37f5be1d1ad6df9d94d5c3ca8de644838e369')

package() {
  install -Dm755 "jazzer" "${pkgdir}/usr/bin/jazzer"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
