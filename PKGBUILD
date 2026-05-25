# Maintainer: Carlos Prieto <prietus@live.com>
pkgname=mopytui-bin
_pkgname=mopytui
pkgver=0.2.0
pkgrel=1
pkgdesc="A feature-rich TUI client for Mopidy with cover art rendering (prebuilt binary)"
arch=('x86_64')
url="https://github.com/prietus/mopytui"
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
)
optdepends=(
  'mopidy: server this client connects to'
  'chafa: better halfblocks rendering on terminals without Kitty/iTerm2/Sixel'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x86_64.tar.gz")
sha256sums=('e30f7f4bd253ba2f1376aee5900e84afa83c6ffb2e178caf0a7869dc79318a32')

package() {
  cd "${srcdir}/${_pkgname}-linux-x86_64"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
