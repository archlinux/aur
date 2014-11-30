# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=wings2-musicpack
pkgver=1.0
pkgrel=3
pkgdesc="Music pack for the wings2 game"
arch=('any')
url="http://www.wings2.net/"
license=('custom')
depends=('wings2')
source=(Complete_Wings2_Music_Pack.zip::http://www.wings2.net/util/download_music.php?file=Complete_Wings2_Music_Pack.zip)
md5sums=('74399ee341e501a7f81622d46267ee13')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/opt/Wings2/music
  cp -r "${srcdir}"/* "${pkgdir}"/opt/Wings2/music
  rm "${pkgdir}"/opt/Wings2/music/*.zip

#remove unneeded playlist and music files
   rm "${pkgdir}"/opt/Wings2/music/menu_music.txt

   rm "${pkgdir}"/opt/Wings2/music/Arto*.ogg
   rm "${pkgdir}"/opt/Wings2/music/*Dimension.ogg
   rm "${pkgdir}"/opt/Wings2/music/*"Wings of Journey"*.ogg

#right file/folder permissions
  find "${pkgdir}"/opt -type d -exec chmod 755 "{}" \;
  find "${pkgdir}"/opt -type f -exec chmod 644 "{}" \;
}
