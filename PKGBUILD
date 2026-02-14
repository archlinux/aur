# Maintainer: Tony Tan qwerasdnoob@gmail.com

pkgname=omarchy-installers
pkgver=1.0.0
pkgrel=1
pkgdesc="Fuzzy-finder installers for pacman and AUR packages (because clicking is too mainstream)"
arch=('any')
url="https://github.com/kantiankant/Omarchy_installers"
license=('GPL3')
depends=('fzf' 'pacman')
optdepends=(
  'yay: for AUR package installation'
  'mlocate: for updating the locate database after installation'
)
source=("aur-installer.sh"
  "pacman-installer.sh")
sha256sums=('4667454675d7a791e17d2f89c100405124247c3761c3918b43696543fd6d5d14'
  '97a591b1301c9bcf262717fdbba14a3b510c19c763e0b5d3d4d27b35b1c08b5b')

package() {
  # Install the scripts to /usr/bin
  install -Dm755 "${srcdir}/aur-installer.sh" "${pkgdir}/usr/bin/aurfetch"
  install -Dm755 "${srcdir}/pacman-installer.sh" "${pkgdir}/usr/bin/pacfetch"
}
