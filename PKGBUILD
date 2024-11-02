#Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
pkgname=moar-bin
pkgver=1.28.0
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
sha256sums=('6997b8c675950481793fbdcd6d0bb85b887901865031136a8135ca3cb28b1dd3')
sha256sums_x86_64=('60467dba9bdab1d70ff4c698bbc28093f7c367e9bc27fab63df79cbff9402b88')
sha256sums_i686=('e93dfa1eab423a53bdd238bed1a8d2717e65278d279a6ca21e8021f37e21e2b3')
sha256sums_pentium4=('e93dfa1eab423a53bdd238bed1a8d2717e65278d279a6ca21e8021f37e21e2b3')
sha256sums_armv6h=('4590c9d26b16744b2e2d39e8e17516f82fc84714bff06e5749c1950f269478f5')
sha256sums_armv7h=('4590c9d26b16744b2e2d39e8e17516f82fc84714bff06e5749c1950f269478f5')
sha256sums_aarch64=('4590c9d26b16744b2e2d39e8e17516f82fc84714bff06e5749c1950f269478f5')

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
