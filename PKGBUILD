# Maintainer: Kaleb Klein <klein.jae@gmail.com>

pkgname=checkmate-git
pkgver=2.3.8
pkgrel=8
pkgdesc="GUI application for verifying and generating checksums"
arch=(any)
license=('LGPL')
url="http://github.com/pazuzu156/checkmate"
depends=('qt5-base' 'qt5-webkit')
source=('git://github.com/pazuzu156/checkmate.git' 'checkmate-git.install' 'gear.png')
md5sums=('SKIP'
         '0bb8448ad311e4cc7eb29ed896bb7f00'
         '735424ee880f55cc8e635343edf3f9fa')
install='checkmate-git.install'

package() {
	cd "$srcdir/checkmate"
	make

	install -D -m755 "${srcdir}/checkmate/src/Checkmate" "${pkgdir}/opt/checkmate/Checkmate"
	# install -D -m755 "${srcdir}/checkmate/updater_src/CheckmateUpdater" "${pkgdir}/opt/checkmate/CheckmateUpdater"

	install -D -m644 "${srcdir}/checkmate/checkmate.desktop" "${pkgdir}/usr/share/applications/checkmate.desktop"
	install -D -m644 "${srcdir}/gear.png" "${pkgdir}/usr/share/icons/checkmate_icon.png"
}
