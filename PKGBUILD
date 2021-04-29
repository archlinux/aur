# Maintainer: Matthias Fulz < mfulz at olznet dot de >

pkgname=betaflight-configurator-nightlies-bin
_pkgname=betaflight-configurator
pkgver=v20210413.2497
_pkgver=10.8.0
pkgrel=1
pkgdesc="Crossplatform configuration tool for the Betaflight flight control system"
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator"
source=("https://github.com/betaflight/betaflight-configurator-nightlies/releases/download/$pkgver/betaflight-configurator_"$_pkgver"_linux64.zip")
sha256sums=('61cd542953fb8fcbfac6cd62484dae96f2bbffdf97b460ce3feff08d181ce0e5')
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
