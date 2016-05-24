# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Alexej Magura <agm2819*gmail*>
#
#
pkgname=lib32-libtinfo
pkgver=6
pkgrel=9
pkgdesc="lib32 symlink to ncurses for use in packages"
arch=('any')
url="http://www.gnu.org/software/ncurses/"
license=('MIT')
#conflicts=('lib32-libtinfo-5')
depends=('lib32-ncurses>=6.0')
_ncurses="$(pacman -Q lib32-ncurses | awk '{sub(/-[0-9]+/, "", $2); print $2}')"

package() {
  install -d "$pkgdir"/usr/lib32
  ln -s /usr/lib32/libncursesw.so."$_ncurses" "$pkgdir"/usr/lib32/libtinfo.so."$pkgver"
  ln -s /usr/lib32/libtinfo.so."$pkgver" "$pkgdir"/usr/lib32/libtinfo.so
#  ln -s /usr/lib32/libtinfo.so."$pkgver" "$pkgdir"/usr/lib32/libtinfo.so.5
}
# vim:set ts=2 sw=2
