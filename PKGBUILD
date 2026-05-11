# Maintainer: Carlos Prieto <prietus@live.com>
pkgname=mopytui-bin
_pkgname=mopytui
pkgver=0.1.0
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
sha256sums=('9cac9735a9099bdb11f418caddc9399645d182c735642093f7787a6686235132')

package() {
  cd "${srcdir}/${_pkgname}-linux-x86_64"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
