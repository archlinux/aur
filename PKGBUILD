# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Ainola

# Notes:
#   + gog:// DLAGENT:
#       - A gog:// DLAGENT can be configured in /etc/makepkg.conf to
#         automatically pull game files from GOG.
#       - https://github.com/Sude-/lgogdownloader

pkgname='gog-dont-starve-shipwrecked'
pkgver=2.3.0.5
pkgrel=1
pkgdesc="Don't Starve: Shipwrecked DLC"
url="https://www.kleientertainment.com/games/dont-starve"
license=('custom')
arch=('i686' 'x86_64')
depends=('gog-dont-starve')
source=(
  "file://gog_don_t_starve_shipwrecked_dlc_${pkgver}.sh"
)
sha256sums=(
  '1a06da5546803c9c8b17f99b876362dec8fc8c85ec26277d10011879ffd19267'
)

prepare() {
  find . -type d -exec chmod 755 {} \;
}

package(){
  install -d "${pkgdir}/opt/gog-dont-starve/"

  cp -r "data/noarch/game/" "${pkgdir}/opt/gog-dont-starve/"
}

# vim: ts=2 sw=2 et:
