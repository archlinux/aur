# Maintainer: Tony Tan <qwerasdnoob@gmail.com>
pkgname=omarchy-installers
pkgver=1.0.0
pkgrel=3
pkgdesc="A port of Omarchy's AUR and pacman package installers for Arch-based distros"
arch=('any')
url="https://github.com/kantiankant/Omarchy_installers"
license=('GPL3')
depends=('fzf' 'pacman')
optdepends=(
  'yay: for AUR package installation'
  'mlocate: for updating the locate database after installation'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kantiankant/Omarchy_installers/archive/v${pkgver}.tar.gz")
sha256sums=('bdd72b8b11cb69b072018ef037adfe878e8a6c7e4c1b0adfa28b208fc269bd04')

package() {
  cd "${srcdir}/Omarchy_installers-${pkgver}"

  install -Dm755 aur-installer.sh "${pkgdir}/usr/bin/aurfetch"
  install -Dm755 pacman-installer.sh "${pkgdir}/usr/bin/pacfetch"
}
