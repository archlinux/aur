# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=concise-keyring
pkgver=1.0.3
pkgrel=1
pkgdesc='Allows for installing packages from Concise repositories'
arch=(any)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
makedepends=(git)                 
source=("https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('2e3c4ea65030a715239d07c9e28765757a7e8793eb6390c2e8c0cc17c6127d5a')

package() {
  install -Dm644 ${srcdir}/usr/share/pacman/keyrings/* -t "${pkgdir}/usr/share/pacman/keyrings/"
  install -Dm755 -o root -g wheel ${srcdir}/opt/Concise/Keyring/* -t "${pkgdir}/opt/Concise/Keyring/"
}
