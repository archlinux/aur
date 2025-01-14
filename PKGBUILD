# Maintainer: Managor <antti.savo@gmail.com>
pkgname=speaker-keepalive
pkgver=1.0.0
pkgrel=2
pkgdesc="Keep speakers with a shutdown timer alive"
arch=('any')
url="https://gitlab.com/Managor/speaker-keepalive"
license=('MIT')
depends=('pipewire')
makedepends=('git' 'meson')
source=("${pkgname}::git+https://gitlab.com/Managor/speaker-keepalive.git")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
    mkdir -p "$pkgdir/usr/bin"

    cd "$pkgname"
    cp -r --no-preserve=ownership build/speaker-keepalive "$pkgdir/usr/bin"
}
