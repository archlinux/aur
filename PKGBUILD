# Maintainer: Alexej Magura <alexej@Aya.localdomain>
pkgname=lib32-libtinfo-5
pkgver=5
pkgrel=5
pkgdesc="lib32 symlink to ncurses for use in packages (legacy)"
arch=(any)
url="http://www.gnu.org/software/ncurses/"
license=('unknown')
depends=('lib32-ncurses<6.0')
conflicts=('lib32-libtinfo')
_ncurses="$(pacman -Q ${depends[0]/<*/} | awk '{sub(/-[0-9]+/, "", $2); print $2}')"

package() {
  install -d "$pkgdir"/usr/lib32
  ln -s /usr/lib32/libncurses.so."$_ncurses" -T "$pkgdir"/usr/lib32/libtinfo.so."$pkgver"
  ln -s /usr/lib32/libtinfo.so."$pkgver" -T "$pkgdir"/usr/lib32/libtinfo.so
}
# vim:set ts=2 sw=2 et:
