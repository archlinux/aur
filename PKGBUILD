# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=octofetch-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="GitHub stats fetch tool"
arch=('x86_64')
url="https://github.com/azur1s/octofetch"
license=('MIT')
depends=('gcc-libs' 'openssl')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
	"LICENSE-$pkgver::$url/raw/$pkgver/LICENSE"
	"README-$pkgver::$url/raw/$pkgver/README.md")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/$pkgver/octofetch")
sha256sums=('0b85b107bb5386b2b35372d2f64a8ccf5079149b239ade6bb3889753011a368c'
            'cdc18e51a9f605601433939192748866a58cb0db5367ca687bfa038b8f4dbd8b')
sha256sums_x86_64=('dba36c4578b86ce6413d075fb06d606a162a34941c5bd7b2d2542ca1ffbaf140')

package() {
	install -D "$pkgname-$pkgver" "$pkgdir/usr/bin/octofetch"
	install -Dm 644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 "README-$pkgver" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
