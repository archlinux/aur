# Maintainer: Amolith <amolith@secluded.site>
pkgname="watt-wiser-bin"
_pkgname=${pkgname%-bin}
pkgdesc="A software energy consumption estimation tool"
_repo="watt-wiser"
pkgver="v0.0.4"
pkgrel=2
arch=("any")
url="https://github.com/wattwisegames/$_repo"
source=("${_repo}-${pkgver}-linux.tar.xz"::"${url}/releases/download/${pkgver}/${_repo}-${pkgver}-linux.tar.xz")
license=("Unlicense")
provides=($_pkgname)
conflicts=("$_pkgname" "watt-wiser-git" "watt-wiser-sensors-git")

sha256sums=('7c8bf25b0ba4f166387a922ffbd860404e65d312a14c8efa7bd64f991ff7e146')

package() {
  cd "${_repo}-${pkgver}-linux"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
