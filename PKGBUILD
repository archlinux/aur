# Maintainer: Alexej Magura <alexej@Aya.localdomain>
pkgname=lib32-libtinfo5
pkgver=5
pkgrel=11
pkgdesc="lib32 symlink to ncurses for use in packages (legacy)"
arch=(any)
url="http://www.gnu.org/software/ncurses/"
license=('MIT')
depends=('lib32-ncurses5-compat-libs')
conflicts=('lib32-libtinfo-5' 'lib32-libtinfo')
replaces=('lib32-libtinfo-5' 'lib32-libtinfo')
_ncurses="$(pacman -Q lib32-ncurses | awk '{sub(/-[0-9]+/, "", $2); print $2}')"

package() {
  install -d "$pkgdir"/usr/lib32
  ln -s /usr/lib32/libncurses.so."$_ncurses" -T "$pkgdir"/usr/lib32/libtinfo.so."$pkgver"
#  ln -s /usr/lib32/libtinfo.so."$pkgver" -T "$pkgdir"/usr/lib32/libtinfo.so
}
# vim:set ts=2 sw=2 et:
