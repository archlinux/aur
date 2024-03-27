# Maintainer: Amolith <amolith@secluded.site>
pkgname="watt-wiser-sensors-bin"
_pkgname=${pkgname%-bin}
pkgdesc="A software energy consumption estimation tool"
_repo="watt-wiser"
pkgver=v0.1.0
pkgrel=1
arch=("any")
url="https://github.com/wattwisegames/$_repo"
source=("${_repo}-${pkgver}-linux.tar.xz"::"${url}/releases/download/${pkgver}/${_repo}-${pkgver}-linux.tar.xz")
license=("Unlicense")
provides=($_pkgname)
conflicts=("$_pkgname" "watt-wiser-git" "watt-wiser-sensors-git")
depends=("lm_sensors")

b2sums=('199b77b298f73f00ae227abfd14a1880a76bc60d279fb87c30367e1c58e67a470c289cf89aeacc7e89c7c4b7ca9bff797631344733f37c0899e5e178e30ceedc')

package() {
  cd "${_repo}-${pkgver}-linux"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
