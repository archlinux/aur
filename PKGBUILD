# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=solve-git
_pkgname=solve
pkgver=r8.1186267
pkgrel=1
pkgdesc="Enables the terminal to perform float point math"
arch=('any')
url='https://gitlab.com/es20490446e/solve'
license=('AGPL')
provides=('solve')
depends=('bash')
makedepends=('git')
source=("solve::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  cp -avR root/usr "${pkgdir}/"
}