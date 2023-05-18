# Maintainer: Kyrill Belomenov <kyrill.belomenov>

_pkgname="rock-paper-scissors"
pkgname="${_pkgname}-git"
pkgver=r47.97718f4
pkgrel=1
pkgdesc="an rock paper scissor game for linux"
arch=('any')
url="https://github.com/kybe236/rock-paper-scissor"
license=('MIT')
depends=("python" "python-requests")
makedepends=('git')
source=('git+https://github.com/kybe236/rock-paper-scissor.git')
md5sums=('SKIP')


pkgver() {
  cd "rock-paper-scissor/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "rock-paper-scissor"
  install -Dvm755 "main.py" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dvm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}-git/LICENSE"
}
