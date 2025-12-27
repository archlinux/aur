# Maintainer: detiam <dehe_tian@outlook.com>

pkgname=ddcci-hotplugd
pkgver=0.1
pkgrel=1
pkgdesc='ddcci-driver-linux hotplug and auto detect, userspace workaround '
arch=(x86_64)
url="https://github.com/detiam/$pkgname"
license=(GPL-3.0-or-later)
depends=(ddcci-driver-linux ddcutil libx11 libxrandr kmod libxau systemd-libs)
optdepends=('systemd: for systemd service support')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('0acb885fa4c50047bc81d7c4070594a9320633811237ff6ba0d16bb7d22e67b2')

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir" make install
}
