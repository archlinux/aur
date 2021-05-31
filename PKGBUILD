# Maintainer: Sajeev Ramasamy <thorion3006@gmail.com>
pkgname=snap-pac-git
pkgver=3.0.1.r0.g6cfaa46
pkgrel=1
pkgdesc="Pacman hooks that use snapper to create pre/post btrfs snapshots like openSUSE's YaST"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/wesbarnett/snap-pac.git"
license=('GPL2')
depends=('btrfs-progs' 'pacman' 'procps-ng' 'snapper')
makedepends=('git' 'python-sphinx')
provides=('snap-pac')
conflicts=('snap-pac')
backup=("etc/snap-pac.ini")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd snap-pac
  printf "$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

package() {
  cd snap-pac
  make DESTDIR="$pkgdir/" install
}
