# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=maxclaw-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Low-memory local-first AI agent"
arch=('x86_64' 'aarch64')
url="https://github.com/Lichas/maxclaw"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/maxclaw_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/maxclaw_linux_arm64.tar.gz")
sha256sums_x86_64=('f88d9a30283014f9c6b146730b25eb11710ecad49fa2b2bd04536ffc82ec742d')
sha256sums_aarch64=('3793ebb5b7a99649ba6e1125311a60c6701724af8ae15f29af11a93ff0b3648c')

package() {
  install -Dm755 "./maxclaw" "${pkgdir}/usr/bin/maxclaw"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
