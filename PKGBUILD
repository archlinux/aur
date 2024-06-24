#Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
pkgname=moar-bin
pkgver=1.24.2
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
sha256sums=('c1eac19cd75ad768d98f3623ef51d24aee900578be74de30c4d6ac52acd314fa')
sha256sums_x86_64=('9c3807d119bcdb6ebd69f430b7e435ad8887e6f5fb14122b6e0b1d522222c42a')
sha256sums_i686=('d4a0c8e9a6c01c88de87092234a9071f7ebba9670017497d157c55be48144657')
sha256sums_pentium4=('d4a0c8e9a6c01c88de87092234a9071f7ebba9670017497d157c55be48144657')
sha256sums_armv6h=('0153f8e44e94d95b66bd2144a9989e29f9f20e1f1359b3a5225a90445aa4a9a8')
sha256sums_armv7h=('0153f8e44e94d95b66bd2144a9989e29f9f20e1f1359b3a5225a90445aa4a9a8')
sha256sums_aarch64=('0153f8e44e94d95b66bd2144a9989e29f9f20e1f1359b3a5225a90445aa4a9a8')

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
