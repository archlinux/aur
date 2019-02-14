# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Thibault Mondary <thibm@free.fr>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=crack-attack-sounds
pkgver=1.1.14
pkgrel=5
_pkg=crack-attack
_patch=40
_fc=fc30
pkgdesc="Sound effects and music for crack-attack, taken from Fedora's package"
arch=('any')
url="https://apps.fedoraproject.org/packages/crack-attack/"
license=('GPL' 'custom:Crystal Stacker freeware')
depends=('crack-attack')
source=("https://kojipkgs.fedoraproject.org/packages/${_pkg}/${pkgver}/${_patch}.${_fc}/src/${_pkg}-${pkgver}-${_patch}.${_fc}.src.rpm")
sha256sums=('8af69a1f232cfa977bfcf538caf24be33aec97ad94533cc96353c986cbef08c3')

prepare() {
  bsdtar -zxf crack-attack-music.tar.gz
  bsdtar -zxf crack-attack-sounds.tar.gz
}

package() {
  mkdir -p "$pkgdir"/usr/share/crack-attack

  cp -r music "$pkgdir"/usr/share/crack-attack
  cp -r data/sounds $pkgdir/usr/share/crack-attack

  install -Dm644 music-sound-copyright.txt "$pkgdir"/usr/share/licenses/${pkgname}/music-sound-copyright.txt
}
