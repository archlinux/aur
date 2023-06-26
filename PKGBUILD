# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=wlr-protocols-git
pkgver=0.0.0.r104.g4264185
pkgrel=1
pkgdesc='Wayland protocols designed for use in wlroots (and other compositors).'
arch=('any')
url="https://gitlab.freedesktop.org/wlroots/wlr-protocols"
license=('MIT')
depends=()
makedepends=('git' 'wayland')
source=("$pkgname::git+https://gitlab.freedesktop.org/wlroots/wlr-protocols")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git tag -a -m "Init" 0.0.0 4e099fc8872beb3ce2232592a5a56ccb485752e5
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" make install
}
