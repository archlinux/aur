#Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
pkgname=moar-bin
pkgver=1.29.0
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
sha256sums=('a3e91b021e8b5d8546c1b0b31a0750396c05488ea2eafd57c2e1b312daa62d91')
sha256sums_x86_64=('95549bd5cf54850f7ccd11a04cba50cfd843cc80e7f8f75460a760c3f0759291')
sha256sums_i686=('9221bcb6ba326456299fb394043e7a89dde087ad4fea9d144a34aa79c1b54428')
sha256sums_pentium4=('9221bcb6ba326456299fb394043e7a89dde087ad4fea9d144a34aa79c1b54428')
sha256sums_armv6h=('eec06ff8d2064618ce17da7b967a9ff8f4f5523675ff7ec5ad2e6694a271acc9')
sha256sums_armv7h=('eec06ff8d2064618ce17da7b967a9ff8f4f5523675ff7ec5ad2e6694a271acc9')
sha256sums_aarch64=('eec06ff8d2064618ce17da7b967a9ff8f4f5523675ff7ec5ad2e6694a271acc9')

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
