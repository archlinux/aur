#Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
pkgname=moar-bin
pkgver=1.26.0
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=('x86_64' 'i686' 'pentium4' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/walles/moar'
license=(BSD-2-Clause-Views)
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver"::"$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-amd64")
source_i686=("$pkgname-$pkgver"::"$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-386")
source_pentium4=("$pkgname-$pkgver"::"$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-386")
source_armv6h=("$pkgname-$pkgver"::"$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-arm")
source_armv7h=("$pkgname-$pkgver"::"$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-arm")
source_aarch64=("$pkgname-$pkgver"::"$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-arm")
noextract=($pkgname-$pkgver.tar.gz)
sha256sums=('d08bbc7340abb149d9651062ed8c3710bd18c16457fd7597f4cbaedefa2be1b5')
sha256sums_x86_64=('7d54d06a9ba30963d68bdca5a7ab438bf4ebae6ee4cec5bd206c46ea704761df')
sha256sums_i686=('a198f574a83175813ece36959370205b5f21f18d8246c9b05595697ef1a5461c')
sha256sums_pentium4=('a198f574a83175813ece36959370205b5f21f18d8246c9b05595697ef1a5461c')
sha256sums_armv6h=('7032a0950c2567bafea954731ff0853ad80661a1f3c6865f5e76050473b1a461')
sha256sums_armv7h=('7032a0950c2567bafea954731ff0853ad80661a1f3c6865f5e76050473b1a461')
sha256sums_aarch64=('7032a0950c2567bafea954731ff0853ad80661a1f3c6865f5e76050473b1a461')

prepare() {
	bsdtar -xvf $pkgname-$pkgver.tar.gz \
	${pkgname%-bin}-$pkgver/LICENSE \
	${pkgname%-bin}-$pkgver/${pkgname%-bin}.1 \
	${pkgname%-bin}-$pkgver/README.md
}

package() {
	install -Dm755 $pkgname-$pkgver "${pkgdir}/usr/bin/${pkgname%-bin}"
	cd "${pkgname%-bin}-$pkgver"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 ${pkgname%-bin}.1 "${pkgdir}/usr/share/man/man1/${pkgname%-bin}.1"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
}
