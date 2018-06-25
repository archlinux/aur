# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=oxy-git
pkgver=2.0.1+1+g6fd7e30
pkgrel=1
pkgdesc='A secure remote access tool (Git)'
arch=(i686 x86_64)
url=https://oxy-secure.app
license=(BSD)
makedepends=(git cargo)
conflicts=(oxy)
source=(git+https://github.com/oxy-secure/oxy#branch=master)
sha512sums=(SKIP)

pkgver() {
  cd $srcdir/oxy
  git describe --tags | sed 's/v//;s/-/+/g'
}

package() {
  cd $srcdir/oxy
  cargo build --release
  install -Dm 755 target/release/oxy $pkgdir/usr/bin/oxy
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/oxy/LICENSE
}
