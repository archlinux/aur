# Maintainer: nezbednik <nezbedniklmao@gmail.com>
pkgname=zfetch
pkgver=2.0.0
pkgrel=1
pkgdesc="simple but pretty fetch script"
arch=("any")
url="https://github.com/jornmann/zfetch"
license=("GPL3")
depends=("bash" "sed" "procps-ng" "coreutils" "gzip")
source=("https://github.com/jornmann/zfetch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("b6c72be1edceba80a25b218cf55d5a2ae9e346c7da42ff5b8eba42ae3160d01c")

package() {
  cd "zfetch-$pkgver"
  mkdir -p "$pkgdir/etc"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man1"
  cp "zfetch.sh" "$pkgdir/usr/bin/zfetch"
  install --mode=644 "zfetchrc" "$pkgdir/etc/zfetchrc"
  gzip "zfetch.1"
  install --mode=644 "zfetch.1.gz" "$pkgdir/usr/share/man/man1"
}
