# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=concise-keyring
pkgver=1.0.1
pkgrel=1
pkgdesc='Allows for installing packages from Concise repositories'
arch=(x86_64)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
makedepends=(git)                 
source=("git+${url}.git")
md5sums=('SKIP')

package() {
  cd "${pkgname}"
  rm -rf "${pkgdir}/usr/share/pacman/keyrings/concise*"
  mkdir -p "${pkgdir}/opt/concise/keyring"
  install -Dm644 ${srcdir}/${pkgname}/usr/share/pacman/keyrings/* -t "${pkgdir}/usr/share/pacman/keyrings/"
  install -Dm644 ${srcdir}/${pkgname}/opt/* -t "${pkgdir}/opt/concise/keyring/"
}
