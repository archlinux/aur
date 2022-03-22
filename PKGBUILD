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
sha256sums=('46bfc357d663be4b42d8ca94aa1be60241f6597f13e9a728fd5ba2640b4e2f83')

package() {
  install -Dm644 ${srcdir}/${pkgname}/usr/share/pacman/keyrings/* -t "${pkgdir}/usr/share/pacman/keyrings/"
  install -Dm755 -o root -g wheel ${srcdir}/${pkgname}/opt/Concise/Keyring/* -t "${pkgdir}/opt/Concise/Keyring/"
}
