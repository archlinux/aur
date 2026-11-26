# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tmux-agent-sidebar-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="tmux sidebar that monitors AI coding agents across sessions in real time"
arch=('x86_64' 'aarch64')
url="https://github.com/hiroppy/tmux-agent-sidebar"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/hiroppy/tmux-agent-sidebar/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/tmux-agent-sidebar-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/tmux-agent-sidebar-linux-aarch64")
sha256sums=('89ebbba6b5ee7cd09e0ecf49375089a2cd197aa59bfde12722911dde690ff833')
sha256sums_x86_64=('e06495a327a074c6e38c3d7697f061bdb6d19f04b67d9fc30137d34d9318e344')
sha256sums_aarch64=('3e3937468ca2725b5f7fa632ae4c71c3beb453cbc429745d8878f0855098a09a')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tmux-agent-sidebar"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
