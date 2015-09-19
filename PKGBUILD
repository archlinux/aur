# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Alexej Magura <agm2819*gmail*>
#
#
pkgbase=lib32-libtinfo
pkgname=(lib32-libtinfo lib32-libtinfo-5)
pkgver=6
pkgrel=2
pkgdesc="lib32 symlink to ncurses for use in packages"
arch=('any')
url="http://www.gnu.org/software/ncurses/"
license=('unknown')
depends=('lib32-ncurses')
_ncurses="$(pacman -Q $depends | awk '{sub(/-[0-9]+/, "", $2); print $2}')"

package_lib32-libtinfo() {
  conflicts=('lib32-libtinfo-5')
  install -d "$pkgdir"/usr/lib32
  ln -s /usr/lib32/libncursesw.so."$_ncurses" -T "$pkgdir"/usr/lib32/libtinfo.so."$pkgver"
  ln -s /usr/lib32/libtinfo.so."$pkgver" -T "$pkgdir"/usr/lib32/libtinfo.so
}

package_lib32-libtinfo-5() {
  pkgver=5
  pkgrel=4
  conflicts=('lib32-libtinfo')
  install -d "$pkgdir"/usr/lib32
  ln -s /usr/lib32/libncurses.so."$_ncurses" -T "$pkgdir"/usr/lib32/libtinfo.so."$pkgver"
  ln -s /usr/lib32/libtinfo.so."$pkgver" -T "$pkgdir"/usr/lib32/libtinfo.so
}

# vim:set ts=2 sw=2 et:
