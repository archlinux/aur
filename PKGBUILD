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
source=(
  "https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
)
sha256sums=(
  '39d84cbb8f8015e30973d61560235c29029b70d1be7a3d5257b727b112e1e684'
  'b385831574ba7bbd0f7a55843407feea1103efb11d6c1539eab2711ccb6e3228')

package() {
  install -Dm644 ${srcdir}/usr/share/pacman/keyrings/* -t "${pkgdir}/usr/share/pacman/keyrings/"
  install -Dm755 -o root -g wheel ${srcdir}/opt/Concise/Keyring/* -t "${pkgdir}/opt/Concise/Keyring/"
}
