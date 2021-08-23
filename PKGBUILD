# Maintainer: 0x715C

pkgname=alda-bin
_pkgname=alda
pkgver=2.0.4
pkgrel=1
pkgdesc='A music programming language for musicians. 🎶'
arch=('x86_64')
url='https://github.com/alda-lang/alda'
license=('EPL')
provides=('alda')
conflicts=('alda')
depends=('java-environment>=8')
options=('!strip')
source=("https://${_pkgname}-releases.nyc3.digitaloceanspaces.com/${pkgver}/client/linux-amd64/${_pkgname}"
        "https://${_pkgname}-releases.nyc3.digitaloceanspaces.com/${pkgver}/player/non-windows/${_pkgname}-player")
sha512sums=('254a584b5ae5f10ee767052afc9d40bd616b613efe142442a9a4caf36eb454eff121d853b87e13382639ee218b5bd7140db16b0dbf003358521326f611c9eb81'
            '3cdc201065acf10e36212f4821c5e00d7c40ec998957803a4fc9d68dac44cdd41c172d2b726f0cdff23257f8c646b101a7397f9ce4f6a3dfb6ae761b9d6e73f7')
noextract=('alda'
           'alda-player')

package() {
  cd "$srcdir"
  install -Dm755 alda \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 alda-player \
    "${pkgdir}/usr/bin/${_pkgname}-player"
}
