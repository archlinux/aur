# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator
pkgver=1.9.1
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('x86_64')
url="https://github.com/iNavFlight/inav-configurator"
source=("https://github.com/iNavFlight/inav-configurator/releases/download/$pkgver/INAV-Configurator_linux64_$pkgver.zip"
inav-configurator.desktop
inav_icon_128.png)
md5sums=('19de1ce1c42a15906395d32ce8462625'
SKIP
SKIP)
options=(!strip)
license=('custom')
provides=("$pkgname")

package() {
  mkdir -p "$pkgdir/opt/inav"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  cp -r --preserve=all "$srcdir/INAV Configurator" "$pkgdir/opt/inav/inav-configurator"
  install -Dm644 "$srcdir/inav_icon_128.png" "$pkgdir/opt/inav/inav-configurator/icon/inav_icon_128.png"
  chmod +x "$pkgdir/opt/inav/inav-configurator/$pkgname"
  ln -s "$pkgdir/opt/inav/inav-configurator/$pkgname" "$pkgdir/usr/bin/$pkgname"
}