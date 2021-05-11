# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=tt-bin
pkgver=0.4.0
pkgrel=3
pkgdesc="Terminal based typing test"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/lemnos/tt"
license=('MIT')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
source=(
	"$pkgname-$pkgver::$url/releases/download/v$pkgver/tt-linux"
	"$url/releases/download/v$pkgver/tt.1.gz"
	"$pkgname-$pkgver-LICENSE::${url/github/raw.githubusercontent}/master/LICENSE"
)
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/tt-linux")
source_armv6h=("$pkgname-$pkgver::$url/releases/download/v$pkgver/tt-linux_arm")
source_armv7h=("$pkgname-$pkgver::$url/releases/download/v$pkgver/tt-linux_arm")
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/tt-linux_arm64")

noextract=(
	"$pkgname-$pkgver"
	"tt.1.gz"
	"$pkgname-$pkgver-LICENSE"
)

b2sums=('9205bf271e5ef2e5d15a8d913f46aa6dd44707b67e073cafbedfe62a0dc88b0c4a77efc8c298f3c2e09f0bdf98a593c5b74e58ba6b612a88c553652f015c30fb'
        'e71a997ee62c49cf86dd5080faa035b4806bb1c0a8ea280e46f75540347c441f9b127fa41f2ee2d11e9af50ceac10e01e7e8570561c0bf4c5ea748244fae5073'
        '2b50a39831de94802d4f09a3f5f28113a856642c10656dfa75f7fe397829051b0e1fa2ae6f499bb3352b9f49932cb016c750ef79acd3895afb6c4955564dd051')
b2sums_x86_64=('9205bf271e5ef2e5d15a8d913f46aa6dd44707b67e073cafbedfe62a0dc88b0c4a77efc8c298f3c2e09f0bdf98a593c5b74e58ba6b612a88c553652f015c30fb')
b2sums_armv6h=('9205bf271e5ef2e5d15a8d913f46aa6dd44707b67e073cafbedfe62a0dc88b0c4a77efc8c298f3c2e09f0bdf98a593c5b74e58ba6b612a88c553652f015c30fb')
b2sums_armv7h=('9205bf271e5ef2e5d15a8d913f46aa6dd44707b67e073cafbedfe62a0dc88b0c4a77efc8c298f3c2e09f0bdf98a593c5b74e58ba6b612a88c553652f015c30fb')
b2sums_aarch64=('9205bf271e5ef2e5d15a8d913f46aa6dd44707b67e073cafbedfe62a0dc88b0c4a77efc8c298f3c2e09f0bdf98a593c5b74e58ba6b612a88c553652f015c30fb')

package() {
	cd "$srcdir"

	install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm644 "tt.1.gz" -t "$pkgdir/usr/share/man/man1"
	install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
