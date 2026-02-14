# Maintainer: Tony Tan <qwerasdnoob@gmail.com>
pkgname=omarchy-installers
pkgver=1.0.2
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
sha256sums=('d9ec1752c7928c7b8211f7171ea2640e08cf2d0e4ca48347dbdb591e4ab44262')

package() {
  cd "${srcdir}/Omarchy_installers-${pkgver}"

  install -Dm755 aur-installer.sh "${pkgdir}/usr/bin/aurfetch"
  install -Dm755 pacman-installer.sh "${pkgdir}/usr/bin/pacfetch"
}
