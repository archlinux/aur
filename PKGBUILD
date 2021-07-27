# Maintainer: Name < dyon at dyonb dot nl >

pkgname=emuflight-configurator-bin
_pkgname=emuflight-configurator
pkgver=0.3.6
pkgrel=1
pkgdesc="Crossplatform configuration tool for the Emuflight flight control system"
arch=('x86_64')
url="https://github.com/emuflight/EmuConfigurator"
source=("https://github.com/emuflight/EmuConfigurator/releases/download/$pkgver/emuflight-configurator_"$pkgver"_linux64.zip")
sha256sums=('7a049477ff91368d2faf610989b824f67367aa5e6c1c2d7581cb5430af83cd6d')
options=(!strip)
license=('GPL3')
conflicts=('emuflight-configurator')

package() {
  mkdir -p "$pkgdir/opt/emuflight"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/Emuflight Configurator/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  cp -dpr --no-preserve=ownership "$srcdir/Emuflight Configurator" "$pkgdir/opt/emuflight/emuflight-configurator"
  ln -s "/opt/emuflight/emuflight-configurator/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
