# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=betaflight-configurator
pkgver=10.3.0
pkgrel=2
pkgdesc="Crossplatform configuration tool for the Betaflight flight control system"
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator"
source=("https://github.com/betaflight/betaflight-configurator/releases/download/$pkgver/betaflight-configurator_"$pkgver"_linux64.zip")
md5sums=('238e48f6398b43471d9953dc03bfeea6')
options=(!strip)
license=('GPL3')

package() {
  mkdir -p "$pkgdir/opt/betaflight"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/Betaflight Configurator/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  cp -dpr --no-preserve=ownership "$srcdir/Betaflight Configurator" "$pkgdir/opt/betaflight/betaflight-configurator"
  ln -s "$pkgdir/opt/betaflight/betaflight-configurator/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
