# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=oxy
pkgver=2.0.1
pkgrel=1
pkgdesc='A secure remote access tool'
arch=(i686 x86_64)
url=https://oxy-secure.app
license=(BSD)
makedepends=(cargo)
source=(https://github.com/oxy-secure/oxy/archive/v$pkgver.tar.gz)
sha512sums=(6220c8c09a313d0d38786ed0507732b9d16e469329d6f88830da3ba7ac2a547224f4742b2dbb72c7982472bda071d13eb746cb9860366aedc6d401ba863ff7f5)

package() {
  cd oxy-$pkgver
  cargo build --release
  install -Dm 755 target/release/oxy $pkgdir/usr/bin/oxy
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/oxy/LICENSE
}
