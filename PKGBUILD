# Maintainer: Kaleb Klein <klein.jae@gmail.com>

pkgname=checkmate-git
pkgver=2.1.4
pkgrel=2
pkgdesc="GUI application for verifying and generating checksums"
arch=(any)
license=('LGPL')
url="http://github.com/pazuzu156/checkmate"
depends=('qt5-base' 'qt5-webkit')
source=('git://github.com/pazuzu156/checkmate.git' 'checkmate-git.install' 'checkmate.desktop' 'gear.png')
md5sums=('SKIP'
         '0bb8448ad311e4cc7eb29ed896bb7f00'
         'b041fa108801bfce8fd7f12c56549297'
         '735424ee880f55cc8e635343edf3f9fa')
install='checkmate-git.install'

package() {
	cd "$srcdir/checkmate"
	make -f Makefile.nix

	install -D -m755 "${srcdir}/checkmate/src/Checkmate" "${pkgdir}/opt/checkmate/Checkmate"
	install -D -m755 "${srcdir}/checkmate/updater_src/CheckmateUpdater" "${pkgdir}/opt/checkmate/CheckmateUpdater"

	install -D -m644 "${srcdir}/checkmate.desktop" "${pkgdir}/usr/share/applications/checkmate.desktop"
	install -D -m644 "${srcdir}/gear.png" "${pkgdir}/usr/share/icons/checkmate_icon.png"
}
