# Maintainer: Alexej Magura <sickhadas.nix*gmail*>
#
#
pkgname=libtinfo-5
pkgver=5
pkgrel=7
pkgdesc="symlink to ncurses for use in cuda and other packages (legacy)"
arch=('any')
url="http://www.gnu.org/software/ncurses/"
license=('unknown')
depends=('ncurses<6.0')
conflicts=('libtinfo')
_ncurses="$(pacman -Q $depends | awk '{sub(/-[0-9]+/, "", $2); print $2}')"

package() {
  install -d "$pkgdir"/usr/lib
  ln -s /usr/lib/libncurses.so."$_ncurses" -T "$pkgdir"/usr/lib/libtinfo.so."$pkgver"
  ln -s /usr/lib/libtinfo.so."$pkgver" -T "$pkgdir"/usr/lib/libtinfo.so
}
