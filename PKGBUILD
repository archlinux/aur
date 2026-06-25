# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>
pkgname=databend
pkgver=1.2.922
pkgrel=1
epoch=
pkgdesc="Opensource alternative to Snowflake"
arch=('aarch64' 'x86_64')
url="https://github.com/databendlabs/databend/releases"
license=('Apache-2.0')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/databend/databend-meta.toml'
        'etc/databend/databend-query.toml')
options=()
install='databend.install'
changelog=
source=("databend.install")
sha256sums=('b6516eed6b0b3ffc35d914581f2e7bb1ccf1effe92d63df59d48984ebf918332')
source_x86_64=("https://github.com/databendlabs/databend/releases/download/v${pkgver}-nightly/databend-v${pkgver}-nightly-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/databendlabs/databend/releases/download/v${pkgver}-nightly/databend-v${pkgver}-nightly-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('d7285028c8dcaece45d2c4b29deb87b8ef94fe854cc45ff677ca1df73a7b6ede')
sha256sums_x86_64=('d9912a1bbb643da2da93ba53d3192e2406b7ca2a1c851b47e291c71f473fabee')
noextract=()

package() {
  cd "$srcdir"

  # Copy bin in /usr/bin
  mkdir -p $pkgdir/usr/bin
  cp -a bin/* $pkgdir/usr/bin

  # Copy cfg files in /etc
  mkdir -p $pkgdir/etc/databend
  cp -a configs/* $pkgdir/etc/databend

  # Copy systemd files
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp systemd/databend-meta.service $pkgdir/usr/lib/systemd/system
  cp systemd/databend-query.service $pkgdir/usr/lib/systemd/system
}

# vim:set ts=2 sw=2 et:
