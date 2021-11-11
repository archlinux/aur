# Maintainer: Mathieu Clabaut <mathieu@clabaut.net>

pkgname=automattermostatus
pkgver=0.1.5
pkgrel=1
pkgdesc='A mattermost custom status automation tool based on available wifi SSID'
arch=('x86_64')
url=https://gitlab.com/matclab/automattermostatus
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-v$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('60020748041bba1682c2ddfbaec70ec6fdc76332648c0a1183f098585d4819f7')

build() {
  cd $pkgname-v$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-v$pkgver
  install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 distrib/$pkgname.desktop "$pkgdir"/etc/xdg/autostart/$pkgname.desktop
}

# vim:set ts=2 sw=2 et:
