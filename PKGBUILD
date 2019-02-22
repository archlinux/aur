# Maintainer: twa022 <twa022 at gmail dot com>
# Maintainer: erik dubois <erik.dubois@gmail.com>
pkgname=surfn-mint-y-icons-git
_pkgname=surfn-mint-y-icons
pkgver=357.1ce9f028
pkgrel=1
pkgdesc="New icons from LinuxMint 18 inspired by the Moka icon set with Surfn as main icon set"
arch=('any')
url="https://github.com/linuxmint/mint-y-icons"
license=('GPL3')
depends=('surfn-icons-git')
makedepends=()
optdepends=()
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}"::git+https://github.com/linuxmint/mint-y-icons.git)
sha256sums=('SKIP')
pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
package() {
  cd ${srcdir}/${_pkgname}/usr/share/icons
  rm -rf Mint-Y
  find .  -name "index.theme" -type f -exec sed -i "s/Name=Mint-Y-/Name=Surfn-Mint-Y-/g" {} \;
  find .  -name "index.theme" -type f -exec sed -i "s/Inherits=Mint-Y,Adwaita,gnome,hicolor/Inherits=Surfn,Adwaita,gnome,hicolor/g" {} \;
  mv Mint-Y-Aqua Surfn-Mint-Y-Aqua
  mv Mint-Y-Blue Surfn-Mint-Y-Blue
  mv Mint-Y-Brown Surfn-Mint-Y-Brown
  mv Mint-Y-Grey Surfn-Mint-Y-Grey
  mv Mint-Y-Orange Surfn-Mint-Y-Orange
  mv Mint-Y-Pink Surfn-Mint-Y-Pink
  mv Mint-Y-Purple Surfn-Mint-Y-Purple
  mv Mint-Y-Red Surfn-Mint-Y-Red
  mv Mint-Y-Sand Surfn-Mint-Y-Sand
  mv Mint-Y-Teal Surfn-Mint-Y-Teal
  cd ${srcdir}/${_pkgname}
  cp -aR ./usr ${pkgdir}
}
