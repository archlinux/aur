# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=concise-keyring
pkgver=1.0.3
pkgrel=1
pkgdesc='Allows for installing packages from Concise repositories'
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
makedepends=(git)                 
source=("https://gitlab.com/a4to/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('7d8875a0f2777601057f5041ace7dd29c04f567f67afd8aef329fab580b85343')

package() {
  install -Dm644 ${srcdir}/usr/share/pacman/keyrings/* -t "${pkgdir}/usr/share/pacman/keyrings/"
  install -Dm755 -o root -g wheel ${srcdir}/opt/Concise/Keyring/* -t "${pkgdir}/opt/Concise/Keyring/"
}
