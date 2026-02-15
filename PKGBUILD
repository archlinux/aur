# Maintainer: Tony Tan <qwerasdnoob@gmail.com>
pkgname=omarchy-installers
pkgver=1.0.4
pkgrel=1
pkgdesc="A port of Omarchy's AUR and pacman package installers for Arch-based distros"
arch=('any')
url="https://github.com/kantiankant/Omarchy_installers"
license=('GPL3')
depends=('fzf' 'pacman' 'gum')
optdepends=(
  'yay: for AUR package installation'
  'mlocate: for updating the locate database after installation'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kantiankant/Omarchy_installers/archive/v${pkgver}.tar.gz")
sha256sums=('b8ed7212ded3baf42297cb0ae3ce87a8567a000df62464dd44c20f9a809ac085')
package() {
  cd "${srcdir}/Omarchy_installers-${pkgver}"
  install -Dm755 aur-installer.sh "${pkgdir}/usr/bin/aurfetch"
  install -Dm755 pacman-installer.sh "${pkgdir}/usr/bin/pacfetch"
}
