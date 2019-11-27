# Contributor: kreed <kreed@kreed.org>
# Contributor: rayman2200
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=mcrcon
pkgver=0.6.1
pkgrel=1
pkgdesc="Console based remote console (rcon) client for Minecraft servers"
arch=('i686' 'x86_64')
url="https://github.com/Tiiffi/mcrcon"
license=('ZLIB')
depends=('glibc')
source=("https://github.com/Tiiffi/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3a8a7185835cb474edad248a5db240f047b24a903f034aac31900f6abcd58b25')

build() {
	cd "$pkgname-$pkgver"
	make LINKER="$LDFLAGS"
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr/" install
	install -m 644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
