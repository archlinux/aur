# Maintainer: 0x715C

pkgname=alda-bin
_pkgname=alda
pkgver=2.1.0
pkgrel=2
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
sha512sums=('e411d512a90cdd9579e958c6ed75e858c9868271af9566bcd81b6ecf76d18ec87062de01dac6989f86f4152c2fc01a1ed145f4655a990052182952ffd6ccb468'
            '1280cfda27b7c5de58829a8a5ff824a3c35a5e2f16a49df28f04e7eef1ad488b574b717b074d28d2b35a4e482563884aea57ddd592f7a6c2a4d1f937cd651cdf'
            '7facf8a504cc74fc7a355b1e3ed732cfc9d96ffd1a231de45708479ee33c786a75b9c8dcba86d355e317d487ab09ba23822a5fe49859ff42bca3657f7c3d26b9')
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
