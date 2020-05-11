# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>
# Contributor: JJK

pkgname=srb2-data
pkgver=2.2.3
instver=2.2.1
pkgrel=1
pkgdesc="Data files for Sonic Robo Blast 2"
arch=('any')
license=('GPL')
url='http://www.srb2.org'
optdepends=('srb2: "Sonic Robo Blast 2" game')
source=(
    "https://github.com/STJr/SRB2/releases/download/SRB2_release_$instver/SRB2-v_${instver//./}-Installer.exe"
    "https://github.com/STJr/SRB2/releases/download/SRB2_release_$pkgver/SRB2-v${pkgver//./}-patch.zip"
)
sha256sums=(
    '5af82508be353dd41b05b793fa7aaef418eab246df7050f72c569f1809b3160f'
    '0de535d33b7848c0cbcaf9c4c6416e180d33a94d68e5d52426e5f2854ab77fc3'
)

package() {
  install -d "$pkgdir"/usr/share/games/SRB2
  install -m644 music.dta {srb2,zones}.pk3 "$pkgdir"/usr/share/games/SRB2
  install -m644 $pkgver-patch/{patch_music,patch}.pk3 $pkgver-patch/player.dta "$pkgdir"/usr/share/games/SRB2
}
