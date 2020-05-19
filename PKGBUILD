# Maintainer: Toolybird <toolybird at tuta dot io>

pkgname=driverctl
pkgver=0.111
pkgrel=1
pkgdesc="Device driver control utility"
arch=('any')
url="https://gitlab.com/driverctl/driverctl"
license=('LGPL2.1')
depends=('bash')
optdepends=('bash-completion: bash completion')
source=("https://gitlab.com/driverctl/driverctl/-/archive/$pkgver/driverctl-$pkgver.tar.bz2")
sha256sums=('31a077a4bf620cb1026d849c53b58697a5812be48d07118aca70f6b8cd3d8d8e')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
