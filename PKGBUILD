# Maintainer: Alexej Magura <sickhadas.nix*gmail*>
#
#
pkgname=libtinfo5
pkgver=5
pkgrel=16
pkgdesc="symlink to ncurses for use in cuda and other packages (legacy)"
arch=('any')
url="http://www.gnu.org/software/ncurses/"
license=('MIT')
conflicts=('libtinfo-5' 'libtinfo<=6-12')
replaces=('libtinfo-5' 'libtinfo<=6-12')
depends=('ncurses5-compat-libs')
replaces=('libtinfo-5')
#_ncurses="$(pacman -Q ncurses | awk '{sub(/-[0-9]+/, "", $2); print $2}')"

package() {
  install -d "$pkgdir"/usr/lib
#  ln -s /usr/lib/libncurses.so."$_ncurses" -T "$pkgdir"/usr/lib/libtinfo.so."$pkgver"
#  ln -s /usr/lib/libtinfo.so."$pkgver" -T "$pkgdir"/usr/lib/libtinfo.so
  ln -s /usr/lib/libncurses.so."$pkgver" -T "$pkgdir"/usr/lib/libtinfo.so."$pkgver"
}

#package_lib32-libtinfo-5() {
#  install -d "$pkgdir"/usr/lib32
#  ln -s /usr/lib32/libncurses.so."$_ncurses" -T "$pkgdir"/usr/lib32/libtinfo.so."$pkgver"
#  ln -s /usr/lib32/libtinfo.so."$pkgver" -T "$pkgdir"/usr/lib32/libtinfo.so
#}
