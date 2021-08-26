# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=mint-y-icons-git
pkgver=r489.69f5a032e
pkgrel=1
epoch=1
pkgdesc="New icons from LinuxMint 18 inspired by the Moka icon set"
arch=(any)
url="https://github.com/linuxmint/mint-y-icons"
license=(GPL3)
makedepends=(git)
optdepends=('mint-x-icons: Mint-Y inherits missing icons from Mint-X')
conflicts=(mint-y-icons)
provides=(mint-y-icons)
options=(!strip)
source=("git+https://github.com/linuxmint/mint-y-icons.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/mint-y-icons"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/mint-y-icons"
  cp -aR ./usr ${pkgdir}
}
