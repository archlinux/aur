# Maintainer: Florian B. <gn0mish@protonmail.com>

pkgname=lib32-libtinfo
pkgver=6
pkgrel=9
pkgdesc="lib32 symlink to ncurses for use in packages"
arch=('any')
url="http://www.gnu.org/software/ncurses/"
license=('MIT')
depends=('lib32-ncurses>=6.0')
_ncurses="$(pacman -Q lib32-ncurses | awk '{print $2}')"

package() {
  install -d "$pkgdir"/usr/lib32
  ln -s /usr/lib32/libncursesw.so."$_ncurses" "$pkgdir"/usr/lib32/libtinfo.so."$pkgver"
  ln -s /usr/lib32/libtinfo.so."$pkgver" "$pkgdir"/usr/lib32/libtinfo.so
}
