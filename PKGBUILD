# Maintainer: Amolith <amolith@secluded.site>
pkgname="watt-wiser-sensors-bin"
_pkgname=${pkgname%-bin}
pkgdesc="A software energy consumption estimation tool"
_repo="watt-wiser"
pkgver=v0.1.3
pkgrel=1
arch=("any")
url="https://github.com/wattwisegames/$_repo"
source=("${_repo}-${pkgver}-linux.tar.xz"::"${url}/releases/download/${pkgver}/${_repo}-${pkgver}-linux.tar.xz")
license=("Unlicense")
provides=($_pkgname)
conflicts=("$_pkgname" "watt-wiser-git" "watt-wiser-sensors-git")
depends=("lm_sensors")
b2sums=('7dfc3f2232b7f9bc65340bb80c5611297d69bb7e10336e496e00dd7a5f51e7e8f0fa68019fa59d8953b86cbf6373f5727e208c0a785784e482f74c748907a400')

package() {
  cd "${_repo}-${pkgver}-linux"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
