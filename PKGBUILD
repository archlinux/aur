# Maintainer: Syner <ploscarusynxy@gmail.com>
pkgname=synfetch-git
pkgver=r0
pkgrel=1
pkgdesc="A fast and highly customizable neofetch-like system information tool with a synthwave theme and live mode"
arch=('any')
url="https://github.com/SXSLVT/synfetch"
license=('GPL3')
depends=('bash')
optdepends=(
  'pciutils: for more accurate GPU detection'
  'nvidia-utils: for better NVIDIA GPU usage monitoring'
)
provides=('synfetch')
conflicts=('synfetch')

source=("git+https://github.com/SXSLVT/synfetch.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/synfetch"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/synfetch"
  install -Dm755 synfetch "${pkgdir}/usr/local/bin/synfetch"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md" 2>/dev/null || true
}
