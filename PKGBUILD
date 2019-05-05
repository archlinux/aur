# Maintainer: twa022 <twa022 at gmail dot com>
# Maintainer: erik dubois <erik.dubois@gmail.com>
pkgname=sardi-orb-colora-mint-y-icons-git
_pkgname=sardi-orb-colora-mint-y-icons
pkgver=367.60234a76
pkgrel=2
pkgdesc="New icons from LinuxMint 18 inspired by the Moka icon set with Sardi-Orb-Colora as main icon set"
arch=('any')
url="https://github.com/linuxmint/mint-y-icons"
license=('GPL3')
depends=('sardi-icons')
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
  rm -rf Mint-Y-Dark
  find .  -name "index.theme" -type f -exec sed -i "s/Name=Mint-Y-/Name=Sardi-Orb-Colora-Mint-Y-/g" {} \;
  find .  -name "index.theme" -type f -exec sed -i "s/Inherits=Mint-Y,Adwaita,gnome,hicolor/Inherits=Sardi-Orb-Colora,Sardi-Flat,Sardi,Surfn,Adwaita,gnome,hicolor/g" {} \;
  mv Mint-Y-Aqua Sardi-Orb-Colora-Mint-Y-Aqua
  mv Mint-Y-Blue Sardi-Orb-Colora-Mint-Y-Blue
  mv Mint-Y-Brown Sardi-Orb-Colora-Mint-Y-Brown
  mv Mint-Y-Grey Sardi-Orb-Colora-Mint-Y-Grey
  mv Mint-Y-Orange Sardi-Orb-Colora-Mint-Y-Orange
  mv Mint-Y-Pink Sardi-Orb-Colora-Mint-Y-Pink
  mv Mint-Y-Purple Sardi-Orb-Colora-Mint-Y-Purple
  mv Mint-Y-Red Sardi-Orb-Colora-Mint-Y-Red
  mv Mint-Y-Sand Sardi-Orb-Colora-Mint-Y-Sand
  mv Mint-Y-Teal Sardi-Orb-Colora-Mint-Y-Teal

  mv Mint-Y-Dark-Aqua Sardi-Orb-Colora-Mint-Y-Dark-Aqua
  mv Mint-Y-Dark-Blue Sardi-Orb-Colora-Mint-Y-Dark-Blue
  mv Mint-Y-Dark-Brown Sardi-Orb-Colora-Mint-Y-Dark-Brown
  mv Mint-Y-Dark-Grey Sardi-Orb-Colora-Mint-Y-Dark-Grey
  mv Mint-Y-Dark-Orange Sardi-Orb-Colora-Mint-Y-Dark-Orange
  mv Mint-Y-Dark-Pink Sardi-Orb-Colora-Mint-Y-Dark-Pink
  mv Mint-Y-Dark-Purple Sardi-Orb-Colora-Mint-Y-Dark-Purple
  mv Mint-Y-Dark-Red Sardi-Orb-Colora-Mint-Y-Dark-Red
  mv Mint-Y-Dark-Sand Sardi-Orb-Colora-Mint-Y-Dark-Sand
  mv Mint-Y-Dark-Teal Sardi-Orb-Colora-Mint-Y-Dark-Teal

  cd ${srcdir}/${_pkgname}
  cp -aR ./usr ${pkgdir}
}
