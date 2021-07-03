# Maintainer: 0x715C

pkgname=alda-bin
_pkgname=alda
pkgver=2.0.0
pkgrel=1
pkgdesc='A music programming language for musicians. 🎶'
arch=('x86_64')
url='https://github.com/alda-lang/alda'
license=('EPL')
provides=('alda')
conflicts=('alda')
options=('!strip')
source=("https://${_pkgname}-releases.nyc3.digitaloceanspaces.com/${pkgver}/client/linux-amd64/${_pkgname}"
        "https://${_pkgname}-releases.nyc3.digitaloceanspaces.com/${pkgver}/player/non-windows/${_pkgname}-player")
sha256sums=('550d3608372278a34864f7c4ed97d063d06393ea93d3f183bd86a528c873b563'
            '904fad363f79b84d84b2046737b2c2cc8fe53877ea07e28cdb7afa8d08273d52')
noextract=('alda'
           'alda-player')

package() {
  cd "$srcdir"
  install -Dm755 alda \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 alda-player \
    "${pkgdir}/usr/bin/${_pkgname}-player"
}
