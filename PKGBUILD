# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter-holy
pkgver=1.1.0
pkgrel=2
pkgdesc='ranger-like file browser written in Rust (holy branch)'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(file)
makedepends=(rust)
optdepends=('ranger: to open files using rifle')
provides=(hunter)
conflicts=(hunter hunter-git hunter-holy-git)
source=($url/archive/v$pkgver-holy.tar.gz)
sha512sums=('8f9b907b062065b289b7481b0ff4a00fc58a533ca56261a9576801a4a22e225caacecce65780f4fd5a41f757fb3854e7452587e5b736c3946bec0100c7527616')

build() {
  cd hunter-$pkgver-holy
  cargo build --release
}

package() {
  cd hunter-$pkgver-holy
  install -D {target/release/hunter,extra/scope.sh} -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/hunter-holy
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/hunter
}
