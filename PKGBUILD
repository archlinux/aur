# Maintainer: Mario Oenning <mo-son at mailbox dot org>
# Author: hattedsquirrel <https://hattedsquirrel.net/>

pkgname=ryzen_monitor
pkgver=1.0.4
pkgrel=1
pkgdesc="Monitor power information of Ryzen processors via the PM table of the SMU"
arch=('x86_64')
url="https://github.com/hattedsquirrel/ryzen_monitor"
license=('AGPL3')
depends=('ryzen_smu')
provides=('ryzen_monitor')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('b68aa8cd30b1a5c7973558eb5eac66430ed92781917f35bdbdded5a112117ee5')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  
  # license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # binary
  install -Dm755 "src/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
