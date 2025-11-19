# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>
pkgname=databend
pkgver=1.2.844
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
sha256sums_aarch64=('85e4d223800932f9276a18aa526eb45e96c56bc30eddcdd612acca899b6b4ead')
sha256sums_x86_64=('6207c1368e8222016c2c41e13c5d0854322cd6c01dc182cddadfac2c5d45a319')
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
