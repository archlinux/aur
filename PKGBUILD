# Maintainer : Michael DeGuzis <mdeguzis@gmail.com>

pkgname=sorr
pkgver=5.1.0
pkgrel=1
pkgdesc="Streets of Rage Remake (fan remake)"
arch=('i686' 'x86_64')
url="http://www.soronline.net/sorr.htm"
license=('GPL')
makedepends=('git')
depends=('zlib' 'zenity' 'lib32-sdl_mixer')
source=("http://www.soronline.net/downloads/sorr_5.0.orig.tar.gz"
	"http://www.soronline.net/downloads/SORRv051_REV030.zip"
	'sorr')
md5sums=('SKIP'
	 '3951863625d44a2222630d47153a19e5'
	 '3d60078ecdd2582e383e477dfdc67ec4')

package() {

  install -d "${pkgdir}/usr/share/games/sorr"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"
  install -d "${pkgdir}/usr/share/doc/sorr"
  install -d "${pkgdir}/usr/bin"

  cp -r ${srcdir}/data "${pkgdir}"/usr/share/games/sorr/data
  cp -r ${srcdir}/manual "${pkgdir}"/usr/share/games/sorr/manual
  cp -r ${srcdir}/mod "${pkgdir}"/usr/share/games/sorr/mod
  cp -r ${srcdir}/palettes "${pkgdir}"/usr/share/games/sorr/palettes
  cp -r ${srcdir}/bennugd "${pkgdir}"/usr/share/games/sorr/bennugd

  install -m755 "${srcdir}/bgdc" "${pkgdir}/usr/share/games/sorr"
  install -m755 "${srcdir}/bgdi" "${pkgdir}/usr/share/games/sorr"
  install -m644 "${srcdir}/SorMaker.dat" "${pkgdir}/usr/share/games/sorr"
  install -m644 "${srcdir}/SorR.dat" "${pkgdir}/usr/share/games/sorr"

  install -m644 "${srcdir}/sorr.png" "${pkgdir}/usr/share/pixmaps"
  install -m644 "${srcdir}/Manual.html" "${pkgdir}/usr/share/games/sorr"
  install -m644 "${srcdir}/sorr.desktop" "${pkgdir}/usr/share/applications/"
  install -m755 "sorr" "${pkgdir}/usr/bin/sorr"

}


