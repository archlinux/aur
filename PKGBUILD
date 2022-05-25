# Maintainer: WillyJL <willy.leslie@icloud.com>
pkgname="ios-mount-git"
pkgver=r19.771a471
pkgrel=1
pkgdesc="Utility script to mount iOS photos and app files on linux, built around ifuse"
arch=("any")
url="https://github.com/Willy-JL/iOS-Mount"
license=("GPL3")
provides=("ios-mount")
conflicts=("ios-mount")
depends=("bash" "ifuse" "zenity")
makedepends=("git")
source=("git+$url.git")
md5sums=("SKIP")

pkgver() {
  cd iOS-Mount
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd iOS-Mount
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/ios-mount/LICENSE"
}
