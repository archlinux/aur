# Maintainer: Connor Etherington <nu1l@null.net>
# ---
pkgname=betterzsh
pkgver=1.0.r5
pkgrel=1
pkgdesc='Configurations to enhance user experience with the ZSH shell.'
arch=(any)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
depends=(zsh xorg-xset)
optdepends=('starship: Adds very useful git functionality to the terminal')
makedepends=(git)                 
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "1.0.r""$(git rev-list --count HEAD)"
}

package() {
  cd ${pkgname}
  install -Dm644 usr/share/zsh/plugins/betterzsh.zsh "${pkgdir}/usr/share/zsh/plugins/betterzsh.zsh"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
