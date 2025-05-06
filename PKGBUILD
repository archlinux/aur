# Maintainer: Arthurmeade12 <s728c3ilp at relay dot firefox dot com>
# Former Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Former Contributor: 0x715C

pkgname=alda-bin
pkgver=2.3.1
pkgrel=1
pkgdesc='A music programming language for musicians'
arch=('i686' 'x86_64')
url='https://github.com/alda-lang/alda'
license=('custom:EPL2')
depends=('java-runtime>=8')
provides=('alda')
conflicts=('alda')
source=("alda-player-$pkgver::https://alda-releases.nyc3.digitaloceanspaces.com/$pkgver/player/non-windows/alda-player"
        'LICENSE')
source_x86_64=("alda-$pkgver-x86_64::https://alda-releases.nyc3.digitaloceanspaces.com/$pkgver/client/linux-amd64/alda")
source_i686=("alda-$pkgver-i686::https://alda-releases.nyc3.digitaloceanspaces.com/$pkgver/client/linux-386/alda")
sha256sums=('5f080e89d4239cc0a55cf212d493f3b1527a73bbd7c011c101f50f5f758bf2e5'
            'f05036abc9c2bf11abecbdd874e9a4cbac8e0f6274afdf56c5cf8395238d1dc8')
sha256sums_i686=('93dbb71ca157dac619a63b476f194d0546c075c40e31ae2b72ca3e75aede1231')
sha256sums_x86_64=('9b877770b82a5a618cc3448ce09fbb9ef57fcad4a807ba1b3038890a1df26e84')

package() {
	install -Dv "alda-$pkgver-$CARCH" "$pkgdir/usr/bin/alda"
	install -Dv "alda-player-$pkgver" "$pkgdir/usr/bin/alda-player"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
