# shellcheck disable=2034,SC2164
# Maintainer: Andres Rodriguez Michel <andresmichelrodriguez@gmail.com>
pkgname=bullseye
pkgver=1.2.1
pkgrel=1
pkgdesc="Control mouse cursor using your keyboard"
arch=(any)
url="https://github.com/Dosx001/bullseye"
source=("https://github.com/Dosx001/bullseye/releases/download/${pkgver}/bullseye_${pkgver}_amd64.deb")
md5sums=("cb12ffa598f3667158743eb80e35d74f")

package() {
  tar xzf data.tar.gz
  for i in 32x32 128x128 256x256@2; do
    install -Dm644 usr/share/icons/hicolor/$i/apps/bullseye.png "$pkgdir/usr/share/icons/hicolor/$i/apps/bullseye.png"
  done
  install -Dm644 usr/share/applications/bullseye.desktop "$pkgdir/usr/share/applications/bullseye.desktop"
  install -Dm755 usr/bin/bullseye "$pkgdir/usr/bin/bullseye"
}
