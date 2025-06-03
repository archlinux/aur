#Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
pkgname=moar-bin
pkgver=1.31.8
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
sha256sums=('77943278d1ca22c3ca405c6a227e4807ce8637b807c40802c739f901ae980151')
sha256sums_x86_64=('b4a2de5985aa39c35a611752f0fd67134a7f8bc4ee859fdc951345ceeae885bb')
sha256sums_i686=('1dedf83ece264d7635f8500bd3f8a7d70b8175aba200251bddb075ffbfae4d4b')
sha256sums_pentium4=('1dedf83ece264d7635f8500bd3f8a7d70b8175aba200251bddb075ffbfae4d4b')
sha256sums_armv6h=('71f333969407e7af1cbdc04c1e472104728a915acd1806662902818406ff564b')
sha256sums_armv7h=('71f333969407e7af1cbdc04c1e472104728a915acd1806662902818406ff564b')
sha256sums_aarch64=('71f333969407e7af1cbdc04c1e472104728a915acd1806662902818406ff564b')

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
