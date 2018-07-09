# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=oxy
pkgver=3.0.0+dev1+85+g46013cc
pkgrel=1
pkgdesc='In-development SSH-alike that uses the Noise protocol'
arch=(any)
url=https://github.com/oxy-secure/oxy
license=(BSD-2-Clause)
makedepends=(git rust-nightly)
conflicts=(oxy-git)
source=(git+$url#commit=46013ccc0eb92929b6fbb9a70ee67fa58be70be1)
sha512sums=(SKIP)

build() {
  cd oxy
  cargo +nightly build --release
}

package() {
  cd oxy
  install -D target/release/oxy $pkgdir/usr/bin/oxy
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/oxy/LICENSE
}
