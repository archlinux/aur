#Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
pkgname=moar-bin
pkgver=1.33.0
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
sha256sums=('1aae66633a1b300e69666555ce8c6c9bdfefded634267ae7ef0a1f58fc2026f9')
sha256sums_x86_64=('7a5092601ffc7d6c4224ba5ac578e6c5752c7c107f9e3f5b3b4ae4ff546edf0b')
sha256sums_i686=('c9e2276638f370e9bd78dcf2508107a5fe14db22c5967fdcb8b3e7d0e16239c1')
sha256sums_pentium4=('c9e2276638f370e9bd78dcf2508107a5fe14db22c5967fdcb8b3e7d0e16239c1')
sha256sums_armv6h=('2d17c30776cb3a9f5bd000a0eeea8ee4f271c04bcba48ed04c0c7cd96c70f398')
sha256sums_armv7h=('2d17c30776cb3a9f5bd000a0eeea8ee4f271c04bcba48ed04c0c7cd96c70f398')
sha256sums_aarch64=('2d17c30776cb3a9f5bd000a0eeea8ee4f271c04bcba48ed04c0c7cd96c70f398')

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
