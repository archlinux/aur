# Maintainer: Syner <ploscarusynxy@gmail.com>
pkgname=synfetch-git
_pkgname=synfetch
pkgver=r1.abcdef
pkgrel=1
pkgdesc="A fast and customizable system info tool with a synthwave theme and live mode"
arch=('any')
url="https://github.com/SXSLVT/synfetch"
license=('GPL3')
depends=('bash')
makedepends=('git')
optdepends=(
  'nvidia-utils: Better NVIDIA GPU usage monitoring'
  'pciutils: Better for accurate GPU detection'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/SXSLVT/synfetch.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"

  # Install the main script
  install -Dm755 synfetch "${pkgdir}/usr/bin/synfetch"

  # Install license
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
