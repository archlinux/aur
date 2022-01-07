# Maintainer: 0x715C

pkgname=alda-bin
_pkgname=alda
pkgver=2.1.0
pkgrel=1
pkgdesc='A music programming language for musicians. 🎶'
arch=('x86_64')
url='https://github.com/alda-lang/alda'
license=('custom:EPL2')
provides=('alda')
conflicts=('alda')
depends=('java-environment>=8')
options=('!strip')
source=("https://${_pkgname}-releases.nyc3.digitaloceanspaces.com/${pkgver}/client/linux-amd64/${_pkgname}"
        "https://${_pkgname}-releases.nyc3.digitaloceanspaces.com/${pkgver}/player/non-windows/${_pkgname}-player"
	"https://github.com/${_pkgname}-lang/${_pkgname}/blob/release-${pkgver}/LICENSE")
sha512sums=('6c895ec60fd3044a2f710684f85aeace749fdda4aea0942128ffca24425009846c2cd034079e1824de479f6f0f80634b12e6a202f57b0ece9497997ad6bb2171'
            'a46470e39108e0e97229da1f72895f8b8217dce70e042e432eaadf0cc51fce1055efafcde6d8447432d51c11279c44fbdb2efe642370116b647da824134c1768'
            'fc870637796c26b2a8add7e07bb6699e9b53ff1bbb6c43e6393a116b3d81ecce08408919c132696113b4e3424a04f1b82b8c2e50bb182f2607e39acb60855215')
noextract=('alda'
           'alda-player'
	   'LICENSE')

package() {
  cd "$srcdir"
  install -Dm755 alda \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 alda-player \
    "${pkgdir}/usr/bin/${_pkgname}-player"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
