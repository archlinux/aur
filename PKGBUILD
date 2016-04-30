# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=mint-y-icons
pkgname=${_pkgname}-git
pkgver=46.704e216
pkgrel=1
pkgdesc="New icons from LinuxMint 18 inspired by the Moka icon set"
arch=('any')
url="https://github.com/linuxmint/mint-y-icons"
license=('GPL3')
depends=()
makedepends=()
optdepends=("mint-x-icons: Mint-Y inherits missing icons from Mint-X")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}"::git+https://github.com/linuxmint/mint-y-icons.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd ${srcdir}/${_pkgname}

  cp -aR ./usr ${pkgdir}
}
