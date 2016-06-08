# Maintainer: Alexej Magura <alexej@Aya.localdomain>
pkgname=lib32-libtinfo5
pkgver=5
pkgrel=10
pkgdesc="lib32 symlink to ncurses for use in packages (legacy)"
arch=(any)
url="http://www.gnu.org/software/ncurses/"
license=('MIT')
depends=('lib32-ncurses5-compat-libs')
conflicts=('libtinfo-5' 'libtinfo<=6-12')
replaces=('libtinfo-5' 'libtinfo<=6-12')
_ncurses="$(pacman -Q lib32-ncurses | awk '{sub(/-[0-9]+/, "", $2); print $2}')"

package() {
  install -d "$pkgdir"/usr/lib32
  ln -s /usr/lib32/libncurses.so."$_ncurses" -T "$pkgdir"/usr/lib32/libtinfo.so."$pkgver"
#  ln -s /usr/lib32/libtinfo.so."$pkgver" -T "$pkgdir"/usr/lib32/libtinfo.so
}
# vim:set ts=2 sw=2 et:
