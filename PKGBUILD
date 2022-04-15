# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: 0x715C

pkgname=alda-bin
pkgver=2.2.1
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
sha256sums=('0d76ac05cb6d68dc1c1e0e42ffdd5f63a74cb2cc527cfc02e93af2c8477256fa'
            'f05036abc9c2bf11abecbdd874e9a4cbac8e0f6274afdf56c5cf8395238d1dc8')
sha256sums_i686=('0722b4d21fd64643a52c69269406c85bf46b348d03d51034c5f55e1a707624d6')
sha256sums_x86_64=('001764042eb3d73952410f0a34137983fc483282a28db4d36cb6fcd96fcb6e2b')

package() {
	install -D "alda-$pkgver-$CARCH" "$pkgdir/usr/bin/alda"
	install -D "alda-player-$pkgver" "$pkgdir/usr/bin/alda-player"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
