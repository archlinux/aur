# Maintainer: 0x715C

pkgname=alda-bin
_pkgname=alda
pkgver=2.0.1
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
sha256sums=('3f70bb81ce8cb253ed4d69cd20b1a83b78c0912228e6a1b7de6aec15754128ba'
            '77fb95c46dbdefef5433060bff0803a556a2dc27dd841ed27ca73e14447fe68b')
noextract=('alda'
           'alda-player')

package() {
  cd "$srcdir"
  install -Dm755 alda \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 alda-player \
    "${pkgdir}/usr/bin/${_pkgname}-player"
}
