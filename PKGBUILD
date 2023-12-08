# Maintainer: Brijesh8291 <brijeshsundi@gmail.com>

pkgname=spotx-git
pkgver=r39.1643199
pkgrel=1
pkgdesc="SpotX Bash Script | Block all audio, banner & video ads | Block logging"
arch=('any')
url="https://github.com/jetfir3/SpotX-Bash"
license=('MIT')
makedepends=('git')
provides=("${pkgname}")
source=("${pkgname}::git+https://github.com/jetfir3/SpotX-Bash.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 spotx.sh "${pkgdir}/usr/bin/spotx"
}
