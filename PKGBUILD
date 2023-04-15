# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: 0x715C

pkgname=alda-bin
pkgver=2.2.4
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
sha256sums=('be10b065cc2a4aca50bd36e1879df9aac3d289c27f84b56fcdfcf29e8c384712'
            'f05036abc9c2bf11abecbdd874e9a4cbac8e0f6274afdf56c5cf8395238d1dc8')
sha256sums_i686=('dad09d72037cccbdc14b1f6dcb9dd5ad8a99e52bbc8a36d2a0703a1bf1078212')
sha256sums_x86_64=('ac7408c5d0d2f5442657bc4c76832310819e101cc34608a9b2c8e8315b41edeb')

package() {
	install -Dv "alda-$pkgver-$CARCH" "$pkgdir/usr/bin/alda"
	install -Dv "alda-player-$pkgver" "$pkgdir/usr/bin/alda-player"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
