# Maintainer: Arthurmeade12 <s728c3ilp at relay dot firefox dot com>
# Former Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Former Contributor: 0x715C

pkgname=alda-bin
pkgver=2.3.2
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
sha256sums=('69456f09b584042f80929d97ceb1945e730d9c75c6b993e880af05b54e3ee802'
            'f05036abc9c2bf11abecbdd874e9a4cbac8e0f6274afdf56c5cf8395238d1dc8')
sha256sums_x86_64=('881c67e68f2d37547d768e11504d76075e3ac45fd0a7f70f4a376f39ef9ad4cb')
sha256sums_i686=('0f3c7601e579ad8d0258715951941cb6e2b6e20a08566c10bae163fbaa784c97')

package() {
	install -Dv "alda-$pkgver-$CARCH" "$pkgdir/usr/bin/"
	install -Dv "alda-player-$pkgver" "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
