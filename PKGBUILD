# Maintainer: Malte Jürgens <maltejur@dismail.de>
# Contributor: Matthias Fulz < mfulz at olznet dot de >

pkgname=betaflight-configurator-nightlies-bin
_pkgname=betaflight-configurator
pkgver=v20220705.142
pkgrel=1
pkgdesc="Nightly builds of the Betaflight Configurator "
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator-nightlies"
source=("https://github.com/betaflight/betaflight-configurator-nightlies/releases/download/v20220705.142/betaflight-configurator_10.9.0-debug-f9ac9f8_linux64-portable.zip")
sha256sums=("afea7d75730f811cdbe3da065a714c96a3d45df429975fdfd4cb9a7b12d7008d")
options=(!strip)
license=("GPL3")
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$pkgname.install

package() {
  mkdir -p "$pkgdir/opt/betaflight"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/Betaflight Configurator/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  cp -dpr --no-preserve=ownership "$srcdir/Betaflight Configurator" "$pkgdir/opt/betaflight/betaflight-configurator"
  ln -s "/opt/betaflight/betaflight-configurator/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
