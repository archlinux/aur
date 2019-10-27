# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=betaflight-configurator-bin
_pkgname=betaflight-configurator
pkgver=10.6.0
pkgrel=1
pkgdesc="Crossplatform configuration tool for the Betaflight flight control system"
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator"
source=("https://github.com/betaflight/betaflight-configurator/releases/download/$pkgver/betaflight-configurator_"$pkgver"_linux64.zip")
sha256sums=('9cea0e8036b77b57d94db7e5ef69efe0ad0dc4b868801cd042f059c5e1f70a26')
options=(!strip)
license=('GPL3')
conflicts=('betaflight-configurator')

package() {
  mkdir -p "$pkgdir/opt/betaflight"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/Betaflight Configurator/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  cp -dpr --no-preserve=ownership "$srcdir/Betaflight Configurator" "$pkgdir/opt/betaflight/betaflight-configurator"
  ln -s "/opt/betaflight/betaflight-configurator/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  echo 'Dont forget to add your user into dialout group "sudo usermod -aG dialout YOUR_USERNAME" for serial access'
}
