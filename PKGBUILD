# Maintainer: Janek S. <development@superyu.xyz>
pkgname='switcheroo-git'
_pkgname='switcheroo'
pkgver='0.2.0'
pkgrel=1
pkgdesc='A cross platform, rust implementation for the Tegra X1 bootROM exploit.'
url='https://github.com/budde25/switcheroo'
source=('git+https://github.com/budde25/switcheroo.git')
arch=('x86_64')
license=('GPL2')
makedepends=('git' 'cargo')
depends=('glibc')
conflicts=('switcheroo')
provides=('switcheroo')
sha256sums=(SKIP)

build() {
  cd $_pkgname
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$_pkgname/target/release/switcheroo" "$pkgdir/usr/bin/switcheroo"
  install -Dm644 "$srcdir/$_pkgname/extra/linux/io.ebudd.Switcheroo.desktop" -t "$pkgdir/usr/share/applications/"
}