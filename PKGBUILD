# Maintainer: detiam <dehe_tian@outlook.com>

pkgname=ddcci-hotplugd
pkgver=0.2
pkgrel=1
pkgdesc='ddcci-driver-linux hotplug and auto detect, userspace workaround '
arch=(x86_64)
url="https://github.com/detiam/$pkgname"
license=(GPL-3.0-or-later)
depends=(ddcutil libx11 libxrandr kmod libxau systemd-libs)
optdepends=('systemd: for systemd service support')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('f2e1b842667c3558a8442d9b69328c0b4091df63737e62ea40d3ae8bd6bcea73')
backup=("etc/${pkgname}.env")

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir" make install
}
