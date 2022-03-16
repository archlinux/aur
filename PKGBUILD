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
  'https://gitlab.com/qYp/concise/-/raw/master/x86_64/concise-keyring-1.0.2-1-any.pkg.tar.zst'
  'https://gitlab.com/qYp/concise/-/raw/master/x86_64/concise-keyring-1.0.2-1-any.pkg.tar.zst.sig'
  )
sha256sums=(
  '14d85dff919ecae2d0aef7b4d48869dc391b7ddac9497eeb963ac09fd5e3a20c'
  '2f50892d21b01890430bfd6690c129dbfa1a161049c3bfbc6bb48317ba72a2d7'
  )

package() {
  install -Dm644 usr/share/pacman/keyrings/* -t "${pkgdir}/usr/share/pacman/keyrings/"
  install -Dm755 -o root -g wheel opt/Concise/Keyring/* -t "${pkgdir}/opt/Concise/Keyring/"
}
