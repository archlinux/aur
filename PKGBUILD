# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=betaflight-configurator
pkgver=10.2.0
pkgrel=1
pkgdesc="Crossplatform configuration tool for the Betaflight flight control system"
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator"
source=("https://github.com/betaflight/betaflight-configurator/releases/download/$pkgver/betaflight-configurator_"$pkgver"_linux64.zip")
md5sums=('8c2be4a4167516f16eb9374007de69a2')
options=(!strip)
license=('custom')
provides=("$pkgname")

package() {
  mkdir -p "$pkgdir/opt/betaflight"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/Betaflight Configurator/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  cp -r --preserve=all "$srcdir/Betaflight Configurator" "$pkgdir/opt/betaflight/betaflight-configurator"
  ln -s "$pkgdir/opt/betaflight/betaflight-configurator/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
