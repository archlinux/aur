# Maintainer: NeverBehave <aur@never.pet>
_commit="69f8f3fd41ba2632534f9bce42816b11fde1e1e8"

pkgname=geocam-v4l2
pkgrel=1
pkgver=r5.69f8f3f
arch=('x86_64')
pkgdesc="MDG-217 camera assembly stream format userspace parser V4L2 plugin. It is necessary for accessing the H.264-encoded stream and is not used with raw streams."
url="https://github.com/digitalloggers/geocam-v4l2/"
license=('unknown')
makedepends=('git')
depends=('v4l-utils')
source=("git+https://github.com/digitalloggers/geocam-v4l2#commit=$_commit")
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
md5sums=('SKIP')

build() {
  cd "$srcdir/geocam-v4l2"
  make
}

package() {
    install -dm755 "$pkgdir/usr/lib/libv4l/plugins/"
    install -m644 "$srcdir/geocam-v4l2/libv4l_geocam.so" "$pkgdir/usr/lib/libv4l/plugins/libv4l_geocam.so"
}
