# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=concise-keyring
pkgver=1.0.3
pkgrel=1
pkgdesc='Allows for installing packages from Concise repositories'
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
source=("https://gitlab.com/a4to/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('337fc116d143cf6351791cc2685a1ee91f42b04ff1392d34ac5e8009fc56b99e')

package() {
  install -Dm644 ${srcdir}/usr/share/pacman/keyrings/* -t "${pkgdir}/usr/share/pacman/keyrings/"
  install -Dm755 -o root -g wheel ${srcdir}/opt/Concise/Keyring/* -t "${pkgdir}/opt/Concise/Keyring/"
}
