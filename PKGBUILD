# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>
# Contributor: JJK
# Contributor: DilithiumNitrate

pkgname=srb2-data
pkgver=2.2.15
pkgver_1=v2215
pkgrel=1
pkgdesc="Data files for Sonic Robo Blast 2"
arch=('any')
license=('custom')
url='http://www.srb2.org'
optdepends=('srb2: "Sonic Robo Blast 2" game')
source=(
    "https://github.com/STJr/SRB2/releases/download/SRB2_release_${pkgver}/SRB2-${pkgver_1}-Full.zip"
)
sha256sums=('3eda3080ab87940fca5e4dcd22b8e041dc1d9e65bfe9177bff68383e9bd58a10')

package() {
  install -d "$pkgdir"/usr/share/games/SRB2
  install -m644 models.dat {music,srb2,zones,characters}.pk3 "$pkgdir"/usr/share/games/SRB2
  if test -f "patch.pk3"; then install -m644 patch.pk3 "$pkgdir"/usr/share/games/SRB2; fi
  cp -r models "$pkgdir"/usr/share/games/SRB2/models
}
