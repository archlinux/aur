# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=borg-tui-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A security-first personal AI assistant with a Ratatui chat TUI, long-term memory, scheduled tasks"
arch=('x86_64' 'aarch64')
url="https://github.com/adelphidata/borg"
license=('MIT')
depends=('alsa-lib' 'glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/adelphidata/borg/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/borg-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/borg-linux-arm64.tar.gz")
sha256sums=('0a28090cb226d5f20c5662bdb6d8dc1b0d23d6d05cdc5745b2a0c5ca8a55c384')
sha256sums_x86_64=('ddb14e39be58ac6b0441e252883b636b13f3d5d85dc236875c8ae4c65dce81fe')
sha256sums_aarch64=('098d2630575c34215385a70229dba30ce75e44d03ad39e7037d0375fafab359a')

package() {
  install -Dm755 "borgd" "${pkgdir}/usr/bin/borgd"
  install -Dm755 "borg" "${pkgdir}/usr/bin/borg"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
