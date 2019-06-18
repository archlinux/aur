# Maintainer: Ryan Scott Lewis <ryanscottlewis@gmail.com>
pkgname=cutback
pkgver=0.0.1_pre
pkgrel=1
pkgdesc="Backup system with the goal of creating smaller, more focused backups"
arch=('x86_64')
url="http://RyanScottLewis.github.io/$pkgname"
license=("MIT")
depends=(
  "tar"
  "findutils"
)
optdepends=(
  "bzip2: bzip compression"
  "gzip: gzip compression"
  "lrzip: lrzip compression"
  "lz4: lz4 compression"
  "lzip: lzip compression"
  "lzma: lzma compression"
  "lzop: lzop compression"
  "xz: xz compression"
  "pv: command progress viewing"
)
backup=(
  "etc/xdg/$pkgname/config.yml"
)
source=("https://github.com/RyanScottLewis/$pkgname/releases/download/0.0.1-pre/$pkgname-linux-$arch-${pkgver//_/-}.tar.gz")
sha512sums=("b5e1cadd95bb1d973de8e3d48419e705d2e1a83aa20cdd408ae75497c257b6b07326db7897a779936375a487f06c03030b26a6572ead9214f0ad366def494eb3")

package() {
  #cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

