# Maintainer : Michael DeGuzis <mdeguzis@gmail.com>

pkgname=sorr
pkgver=5.0.0
pkgrel=4
pkgdesc="Streets of Rage Remake (fan remake)"
arch=('i686' 'x86_64')
url="http://www.soronline.net/sorr.htm"
license=('GPL')
makedepends=('git')
depends=('zlib' 'zenity' 'lib32-sdl_mixer')
source=("http://www.soronline.net/downloads/sorr_5.0.orig.tar.gz"
	'sorr')
md5sums=('SKIP'
	 'ed2721a9743c36bcf2cb6993e539c047')

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
  install -m644 "${srcdir}/Manual.html" "${pkgdir}/usr/share/doc/sorr"
  install -m644 "${srcdir}/sorr.desktop" "${pkgdir}/usr/share/applications/"
  install -m755 "sorr" "${pkgdir}/usr/bin/sorr"

}


