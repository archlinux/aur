# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=concise-keyring
pkgver=1.0.1
pkgrel=1
pkgdesc='The Concise Keyring'
arch=(x86_64)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
makedepends=(git)                 
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  printf "1.0.""$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  rm -rf "${pkgdir}/usr/share/pacman/keyrings/concise*"
  mkdir -p "${pkgdir}/opt/concise"
  install -Dm644 ${srcdir}/${pkgname}/usr/share/pacman/keyrings/* -t "${pkgdir}/usr/share/pacman/keyrings/"
  install -Dm644 ${srcdir}/${pkgname}/opt/* -t "${pkgdir}/opt/concise/"
}
