# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=concise-keyring
pkgver=1.0.2
pkgrel=1
pkgdesc='Allows for installing packages from Concise repositories'
arch=(any)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
makedepends=(git)                 
source=("git+${url}.git")
md5sums=('SKIP')

package() {
  cd "${pkgname}"
  install -Dm644 ${srcdir}/${pkgname}/usr/share/pacman/keyrings/* -t "${pkgdir}/usr/share/pacman/keyrings/"
  install -Dm755 -o root -g wheel ${srcdir}/${pkgname}/opt/Concise/Keyring/* -t "${pkgdir}/opt/Concise/Keyring/"
}
