# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=betaflight-configurator
pkgver=10.1.0
pkgrel=1
pkgdesc="Crossplatform configuration tool for the Betaflight flight control system"
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator"
source=("https://github.com/betaflight/betaflight-configurator/releases/download/$pkgver/Betaflight-Configurator_linux64_$pkgver.zip")
md5sums=('feceea8247823f9a9074efe33298acda')
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
