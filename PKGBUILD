# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Ainola

# Notes:
#   + gog:// DLAGENT:
#       - A gog:// DLAGENT can be configured in /etc/makepkg.conf to
#         automatically pull game files from GOG.
#       - https://github.com/Sude-/lgogdownloader

pkgname='gog-dont-starve-rog'
pkgver=2.1.0.4
pkgrel=1
pkgdesc="Don't Starve: Reign of Giants DLC"
url="https://www.kleientertainment.com/games/dont-starve"
license=('custom')
arch=('i686' 'x86_64')
depends=('gog-dont-starve')
source=(
  "file://gog_don_t_starve_reign_of_giants_dlc_${pkgver}.sh"
)
sha256sums=(
  'a041e88a7be055d99f65eec1bdfc998eb744dc8d6a3a234fffe68a00ccd6065a'
)

prepare() {
  find . -type d -exec chmod 755 {} \;
}

package(){
  install -d "${pkgdir}/opt/gog-dont-starve/"

  cp -r "data/noarch/game/" "${pkgdir}/opt/gog-dont-starve/"
}

# vim: ts=2 sw=2 et:
