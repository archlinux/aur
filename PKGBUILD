# Maintainer: Arthurmeade12 <s728c3ilp at relay dot firefox dot com>
# Former Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Former Contributor: 0x715C

pkgname=alda-bin
pkgver=2.2.5
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
sha256sums=('bde2d7c169cdc0d59b6ed3f8babbfa056f3a9e640adc34ea868fb9510e881c9c'
            'f05036abc9c2bf11abecbdd874e9a4cbac8e0f6274afdf56c5cf8395238d1dc8')
sha256sums_i686=('ded6362305d43d325880af3593e2f6894d0fdb744eb35e30230b4feb162fe8bf')
sha256sums_x86_64=('8ef002b168cac4541b6c4da10fea051e7b528fe7f3c78d847011b00077de40c4')

package() {
	install -Dv "alda-$pkgver-$CARCH" "$pkgdir/usr/bin/alda"
	install -Dv "alda-player-$pkgver" "$pkgdir/usr/bin/alda-player"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
