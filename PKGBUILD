#Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
pkgname=moar-bin
pkgver=1.31.10
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=('x86_64' 'i686' 'pentium4' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/walles/moar'
license=(BSD-2-Clause-Views)
conflicts=(moarvm) #Both packages install a file to /usr/bin/moar
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
source_x86_64=("$pkgname-$pkgver"::"$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-amd64")
source_i686=("$pkgname-$pkgver"::"$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-386")
source_pentium4=("$pkgname-$pkgver"::"$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-386")
source_armv6h=("$pkgname-$pkgver"::"$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-arm")
source_armv7h=("$pkgname-$pkgver"::"$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-arm")
source_aarch64=("$pkgname-$pkgver"::"$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-arm")
noextract=($pkgname-$pkgver.tar.gz)
sha256sums=('e15c301e7ee2a30407dad6941166260da233475d1058b60e8c8d07c6e65de92b')
sha256sums_x86_64=('27f6d1d38c300b90cf389a4159765e214b7a9c4fd2a4897caf9003a7a2c0ec8d')
sha256sums_i686=('5e76241ab0a2228f7279a3c926a87238b431716bb26851433a6e5545deaf6cdb')
sha256sums_pentium4=('5e76241ab0a2228f7279a3c926a87238b431716bb26851433a6e5545deaf6cdb')
sha256sums_armv6h=('258e4365a63ef3b93720f034b54d2a8d6d346c72925ec3fe6676e5878ad02fd5')
sha256sums_armv7h=('258e4365a63ef3b93720f034b54d2a8d6d346c72925ec3fe6676e5878ad02fd5')
sha256sums_aarch64=('258e4365a63ef3b93720f034b54d2a8d6d346c72925ec3fe6676e5878ad02fd5')

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
