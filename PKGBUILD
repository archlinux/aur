# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=wings2-levelpack
pkgver=1.0
pkgrel=3
pkgdesc="Level pack for the Wings2 game"
arch=('any')
url="http://www.wings2.net/"
license=('custom')
depends=('wings2')
source=(Wings2_Level_Collection_v1.zip::http://www.wings2.net/util/download_levels.php?file=Wings2_Level_Collection_v1.zip)
md5sums=('d38aa08efefff60f1af9a5b656118475')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/opt/Wings2/levels
  cp -r "${srcdir}"/* "${pkgdir}"/opt/Wings2/levels
  rm "${pkgdir}"/opt/Wings2/levels/*.zip

#remove unneeded level files
  rm "${pkgdir}"/opt/Wings2/levels/africa.lev
  rm "${pkgdir}"/opt/Wings2/levels/cerulean.lev
  rm "${pkgdir}"/opt/Wings2/levels/frozen.lev
  rm "${pkgdir}"/opt/Wings2/levels/furious.lev
  rm "${pkgdir}"/opt/Wings2/levels/stones_n_shit.lev

#fix permissions
  find "${pkgdir}"/opt -type d -exec chmod 755 "{}" \;
  find "${pkgdir}"/opt -type f -exec chmod 644 "{}" \;
}
