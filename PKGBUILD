# Maintainer: Dolores Portalatin <meskarune at gmail dot com>
# Contributor: burntcookie90 <aur at vishnurajeevan dot com>
_gitname=i3lock-fancy
_branch=dualmonitors
pkgname=i3lock-fancy-dualmonitors-git
pkgver=r89.9539878
pkgrel=2
pkgdesc="i3lock-color script: blurs background, adds lock icon and text with multihead support."
arch=('i686' 'x86_64')
url="https://github.com/meskarune/i3lock-fancy"
license=('MIT')
depends=('coreutils' 'awk' 'bash' 'util-linux' 'imagemagick' 'i3lock' 'scrot')
makedepends=('git')
provides=("i3lock-fancy-dualmonitors")
source=("git+https://github.com/meskarune/$_gitname.git#branch=$_branch")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
    cd "${srcdir}"/"$_gitname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
