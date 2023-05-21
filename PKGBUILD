# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>
# Contributor: JJK
# Contributor: DilithiumNitrate

pkgname=srb2-data
pkgver=2.2.11
pkgver_1=v2211
pkgrel=1
pkgdesc="Data files for Sonic Robo Blast 2"
arch=('any')
license=('custom')
url='http://www.srb2.org'
optdepends=('srb2: "Sonic Robo Blast 2" game')
source=(
    "https://github.com/STJr/SRB2/releases/download/SRB2_release_${pkgver}/SRB2-${pkgver_1}-Full.zip"
)
sha256sums=('2ac2489027330ff1f2230132e5d237cec1db58508c05a0a80878b37eea45a163')

package() {
  install -d "$pkgdir"/usr/share/games/SRB2
  install -m644 models.dat {player,music}.dta {srb2,zones}.pk3 "$pkgdir"/usr/share/games/SRB2
  if test -f "patch.pk3"; then install -m644 patch.pk3 "$pkgdir"/usr/share/games/SRB2; fi
  cp -r models "$pkgdir"/usr/share/games/SRB2/models
}
