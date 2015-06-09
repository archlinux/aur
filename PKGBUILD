# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Alexej Magura <agm2819*gmail*>
#
#
pkgname=lib32-libtinfo
pkgver=5
pkgrel=3
pkgdesc="lib32 symlink to ncurses for use in packages"
arch=('any')
url="http://www.gnu.org/software/ncurses/"
license=('unknown')
depends=('lib32-ncurses')
_ncurses="$(pacman -Q $depends | awk '{sub(/-[0-9]+/, "", $2); print $2}')"

package() {
  install -d "$pkgdir"/usr/lib32
  ln -s /usr/lib32/libncurses.so."$_ncurses" -T "$pkgdir"/usr/lib32/libtinfo.so."$pkgver"
  ln -s /usr/lib32/libtinfo.so."$pkgver" -T "$pkgdir"/usr/lib32/libtinfo.so
}

# vim:set ts=2 sw=2 et:
