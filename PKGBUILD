# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=scopey-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="Keep AI coding agent sessions on scope"
arch=('x86_64' 'aarch64')
url="https://github.com/ArchAstro/scopey"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/scopey-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/scopey-linux-arm64.tar.gz")
sha256sums_x86_64=('3510a8c97da7236397c84be11374d6724017ffc87d82176e20bdd2c14e8bcb51')
sha256sums_aarch64=('f6d3e7978d2493d7d64b4d31a4782f049b5eb799a4f89d507e79091bb378ae92')

package() {
  install -Dm755 "./scopey" "${pkgdir}/usr/bin/scopey"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
