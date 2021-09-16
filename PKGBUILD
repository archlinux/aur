# Maintainer: 0x715C

pkgname=alda-bin
_pkgname=alda
pkgver=2.0.5
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
sha512sums=('b3f16cd1eca537e836f20186b6ef76565e7faa24ad11750dee45a297f2025e84c30541443310c3d743dd0452864f3b11a201b6cd94f59ec8a35df5e4bc1a4327'
'3001273140ed45bb9ee80558e014229c1ad5c069eea6d990cfe51a39e8108686d6ba5a6ccc1cabd70a1eb432b42b9d9ef9a75add711464e2c1bfe2f70cd85d38')
noextract=('alda'
           'alda-player')

package() {
  cd "$srcdir"
  install -Dm755 alda \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 alda-player \
    "${pkgdir}/usr/bin/${_pkgname}-player"
}
