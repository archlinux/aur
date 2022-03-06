# Maintainer: nezbednik <nezbedniklmao@gmail.com>
pkgname=zfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="simple but pretty fetch script"
arch=("any")
url="https://github.com/jornmann/zfetch"
license=("GPL3")
depends=("bash" "sed" "procps-ng" "coreutils" "gzip")
source=("https://github.com/jornmann/zfetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("380752fa36a9cd9d212be4283f41de441a798b6055ea0b8a607c78c8ee0c20b1")

package() {
  cd "zfetch-$pkgver"
  mkdir -p "$pkgdir/etc"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man1"
  make "ROOT_INSTALL_DIR=$pkgdir/usr/bin/" install
  install --mode=644 "zfetchrc" "$pkgdir/etc/zfetchrc"
  gzip "zfetch.1"
  install --mode=644 "zfetch.1.gz" "$pkgdir/usr/share/man/man1"
}
