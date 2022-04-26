# Maintainer: Malte Jürgens <maltejur@dismail.de>
# Contributor: Matthias Fulz < mfulz at olznet dot de >

pkgname=betaflight-configurator-nightlies-bin
_pkgname=betaflight-configurator
pkgver=v20220425.103
pkgrel=1
pkgdesc="Nightly builds of the Betaflight Configurator "
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator-nightlies"
source=("https://github.com/betaflight/betaflight-configurator-nightlies/releases/download/v20220425.103/betaflight-configurator_10.8.0-debug-52d8a16_linux64-portable.zip")
sha256sums=("d0bbb3f7dcb6e6cdda563af32310092f2b0d20dd36773d419b9d67cae092d33b")
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
