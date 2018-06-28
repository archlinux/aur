# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=betaflight-configurator
pkgver=10.3.1
pkgrel=3
pkgdesc="Crossplatform configuration tool for the Betaflight flight control system"
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator"
source=("https://github.com/betaflight/betaflight-configurator/releases/download/$pkgver/betaflight-configurator_"$pkgver"_linux64.zip")
md5sums=('bd4f6a7491faf92606f7c6ddd163a379')
options=(!strip)
license=('GPL3')

package() {
  mkdir -p "$pkgdir/opt/betaflight"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/Betaflight Configurator/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  cp -dpr --no-preserve=ownership "$srcdir/Betaflight Configurator" "$pkgdir/opt/betaflight/betaflight-configurator"
  ln -s "$pkgdir/opt/betaflight/betaflight-configurator/$pkgname" "$pkgdir/usr/bin/$pkgname"

  echo "Dont forget to add your user into dialout group "sudo usermod -aG dialout YOUR_USERNAME" for serial access"
}
