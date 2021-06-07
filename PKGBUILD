# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=tt-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Terminal based typing test"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/lemnos/tt"
license=('MIT')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
source=(
	"$pkgname-$pkgver.1.gz::${url/github/raw.githubusercontent}/v$pkgver/tt.1.gz"
	"$pkgname-$pkgver-LICENSE::${url/github/raw.githubusercontent}/v$pkgver/LICENSE"
)
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/${pkgname%-bin}-linux")
source_armv7h=("$pkgname-$pkgver-armv7h::$url/releases/download/v$pkgver/${pkgname%-bin}-linux_arm")
source_aarch64=("$pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/${pkgname%-bin}-linux_arm64")

noextract=(
	"tt.1.gz"
)

b2sums=('e71a997ee62c49cf86dd5080faa035b4806bb1c0a8ea280e46f75540347c441f9b127fa41f2ee2d11e9af50ceac10e01e7e8570561c0bf4c5ea748244fae5073'
        '2b50a39831de94802d4f09a3f5f28113a856642c10656dfa75f7fe397829051b0e1fa2ae6f499bb3352b9f49932cb016c750ef79acd3895afb6c4955564dd051')
b2sums_x86_64=('47822efb46b3bd7ad967206611f24de7e52c3c930679d19375997c8316e8b304967b726e86b662d0872771028f8bd5cf1f92ecae2f27003f17b847981d8c4524')
b2sums_armv7h=('fcb7f523ed4b5865e0f1677b5f0ed24d80554ba8953b8b39ec9a8687067c37b51d36f15376eed707ef5ce8f562fde46bf535ec98fa67283300e4257323e46233')
b2sums_aarch64=('921ec8f0f9b9705f417d63955e02c53b1acd422d9a859352310815de323dd10f38cd82849ccc31bfd2fc9dfa9157cb78a69f271c679c6ca404d7f1aae8d8fee7')

package() {
	install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm644 "$pkgname-$pkgver.1.gz" "$pkgdir/usr/share/man/man1/${pkgname%-bin}.1.gz"
	install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
