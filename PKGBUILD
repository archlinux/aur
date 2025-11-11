# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>
pkgname=databend
pkgver=1.2.833
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
sha256sums_aarch64=('92a4bbfbc6a092e9a27a1987004d34625d7296d95b2cad31d732d7ddf51d435f')
sha256sums_x86_64=('7697cc93ebd5924672a02a3b74359af37a7325df4ae474ba356344cff15fc30e')
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
