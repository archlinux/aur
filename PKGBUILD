# Maintainer: Tony Tan <qwerasdnoob@gmail.com>
pkgname=omarchy-installers
pkgver=1.0.3
pkgrel=1
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
sha256sums=('251ef7d5897b066c94ef929510e3273f7740e6ea9bc4a73818e5d19d099bcda3')

package() {
  cd "${srcdir}/Omarchy_installers-${pkgver}"

  install -Dm755 aur-installer.sh "${pkgdir}/usr/bin/aurfetch"
  install -Dm755 pacman-installer.sh "${pkgdir}/usr/bin/pacfetch"
}
