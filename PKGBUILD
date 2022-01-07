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
	"https://raw.githubusercontent.com/${_pkgname}-lang/${_pkgname}/release-${pkgver}/LICENSE")
sha512sums=('e411d512a90cdd9579e958c6ed75e858c9868271af9566bcd81b6ecf76d18ec87062de01dac6989f86f4152c2fc01a1ed145f4655a990052182952ffd6ccb468'
            '1280cfda27b7c5de58829a8a5ff824a3c35a5e2f16a49df28f04e7eef1ad488b574b717b074d28d2b35a4e482563884aea57ddd592f7a6c2a4d1f937cd651cdf'
            '7d45830c2f7c0d234f02c69da8ccc86865b2168c5f273f299bbfdf0746aa61d471ee571c15d32f676bc515a74ec3d76135e3e45ed5cf453b0cf2ac4e103ed5ea')
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
