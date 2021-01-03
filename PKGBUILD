# Maintainer: Dyon < dyon at dyonb dot nl >

pkgname=emuflight-configurator-bin
_pkgname=emuflight-configurator
pkgver=0.3.5
pkgrel=1
pkgdesc="Crossplatform configuration tool for the Emuflight flight control system"
arch=('x86_64')
url="https://github.com/emuflight/EmuConfigurator"
source=("https://github.com/emuflight/EmuConfigurator/releases/download/$pkgver/emuflight-configurator_"$pkgver"_linux64.zip")
sha256sums=('d55bdc52cf93d58c728ccb296ef912a5fc0f42c57ed95f3ded5f85d1c10838c4')
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
