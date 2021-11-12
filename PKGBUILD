# Maintainer: 0x715C

pkgname=alda-bin
_pkgname=alda
pkgver=2.0.6
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
sha512sums=('6c895ec60fd3044a2f710684f85aeace749fdda4aea0942128ffca24425009846c2cd034079e1824de479f6f0f80634b12e6a202f57b0ece9497997ad6bb2171'
            'a46470e39108e0e97229da1f72895f8b8217dce70e042e432eaadf0cc51fce1055efafcde6d8447432d51c11279c44fbdb2efe642370116b647da824134c1768')
noextract=('alda'
           'alda-player')

package() {
  cd "$srcdir"
  install -Dm755 alda \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 alda-player \
    "${pkgdir}/usr/bin/${_pkgname}-player"
}
